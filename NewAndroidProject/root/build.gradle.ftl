apply from: 'libraries.gradle'

buildscript {
    repositories {
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
		classpath 'me.tatarka:gradle-retrolambda:3.5.0'
    }
}

allprojects {
    repositories {
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
