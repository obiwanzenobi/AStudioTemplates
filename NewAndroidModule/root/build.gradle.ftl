<#import "./shared_macros.ftl" as shared>
<#if isInstantApp>
apply plugin: 'com.android.feature'
<#else>
  <#if isLibraryProject>
apply plugin: 'com.android.library'
  <#else>
apply plugin: 'com.android.application'
  </#if>
</#if>
<#if includeKotlinSupport!false>
apply plugin: 'kotlin-android'
</#if>

<@shared.androidConfig hasApplicationId=isApplicationProject applicationId=packageName isBaseFeature=isBaseFeature hasTests=true canHaveCpp=true/>

android {
    compileSdkVersion rootProject.ext.compileSdkVersion
    buildToolsVersion rootProject.ext.buildToolsVersion

    defaultConfig {
    <#if !(isLibraryProject!false) && !(isInstantApp!false)>
    applicationId "${packageName}"
    </#if>
        minSdkVersion rootProject.ext.minSdkVersion
        targetSdkVersion rootProject.ext.targetSdkVersion
        versionCode 1
        versionName "1.0"

        testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"

    <#if includeCppSupport!false && cppFlags != "">
        externalNativeBuild {
            cmake {
                cppFlags "${cppFlags}"
            }
        }
    </#if>
    }
	compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
<#if enableProGuard>
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
</#if>
<#if includeCppSupport!false>
    externalNativeBuild {
        cmake {
            path "CMakeLists.txt"
        }
    }
</#if>
}

dependencies {
<#if includeKotlinSupport!false>
    compile "org.jetbrains.kotlin:kotlin-stdlib-jre7:$kotlin_version"
</#if>
<#if isLibraryProject || !(isInstantApp!false)>
    compile fileTree(dir: 'libs', include: ['*.jar'])
	
	def libraries = project.libraries;
	
	androidTestCompile libraries.supportAnnotations
    androidTestCompile libraries.design
    androidTestCompile libraries.recyclerView

    androidTestCompile libraries.espresso
    androidTestCompile libraries.testRunner
    androidTestCompile libraries.testRules

    testCompile libraries.junit
    testCompile libraries.junitParamsRunner
    testCompile libraries.mockito
    testCompile libraries.robolectric
	
	compile libraries.supportAppcompat
    compile libraries.supportDesign
	
	compile libraries.dagger
    annotationProcessor libraries.daggerCompiler
    provided libraries.javaxAnnotationJsr250w
	
	provided libraries.autoValue
    provided libraries.autoValueGson

    annotationProcessor libraries.autoValue
    annotationProcessor libraries.autoValueGson

    compile libraries.rxJava
    compile libraries.rxAndroid

    compile libraries.gson
    compile libraries.retrofit
    compile libraries.retrofitGson
    compile libraries.retrofitRx
    compile libraries.timber
    compile libraries.eventbus
	
    <#if WearprojectName?has_content && NumberOfEnabledFormFactors?has_content && NumberOfEnabledFormFactors gt 1 && Wearincluded>
    wearApp project(':${WearprojectName}')
    compile 'com.google.android.gms:play-services-wearable:+'

    </#if>
	<#if isInstantApp>
  <#if isBaseFeature>
    <#if monolithicModuleName?has_content>
    application project(':${monolithicModuleName}')
    <#else>
    // TODO: Add dependency to the main application.
    // application project(':app')
    </#if>
  <#else>
    implementation project(':${baseFeatureName}')
  </#if>
</#if>
<#elseif alsoCreateIapk!false>
    compile project(':${atomName}')
</#if>
}
