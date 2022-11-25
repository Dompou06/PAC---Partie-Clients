<template>
    <div id="nav-manager">
        Manager
    </div>
</template>

<style scoped lang="scss">
@import "../../../assets/sass/libs/variables.scss";
@import "../../../assets/sass/style.scss";

 #nav-manager {
    position: relative;
        height: 50%;
        width: 20vw;
        background-color: red;
    }
//Pour desktop
@media #{$desktop-up} {
    #nav-manager {
        max-height: 20%;
        width: 20vw;
        background-color: red;
    }
}

</style>