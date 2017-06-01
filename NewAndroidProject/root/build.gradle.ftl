apply from: 'libraries.gradle'

buildscript {
<#if includeKotlinSupport!false>ext.kotlin_version = '${kotlinVersion}'</#if>
    repositories {
	 maven { url 'https://maven.google.com' }
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
<#if isInstantApp!false>
        flatDir(name: 'support', dirs: '${whSupportLibDir}')
</#if>
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:${gradlePluginVersion}'
		<#if includeKotlinSupport!false>classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"</#if>
    }
}

allprojects {
    repositories {
        maven { url 'https://maven.google.com' }
        jcenter()
<#if includeKotlinSupport!false>
        mavenCentral()
</#if>
<#if isInstantApp!false>
        flatDir(name: 'support', dirs: '${whSupportLibDir}')
</#if>
    }
}

task clean(type: Delete) {
    delete rootProject.buildDir
}
ext {
	minSdkVersion = <#if minApi?matches("^\\d+$")>${minApi}<#else>'${minApi}'</#if>
    buildToolsVersion = "${buildToolsVersion}"
    compileSdkVersion = <#if buildApiString?matches("^\\d+$")>${buildApiString}<#else>'${buildApiString}'</#if>
    targetSdkVersion = <#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>
}
