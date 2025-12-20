import { defineBuildConfig } from "@kesplus/kesplus";
/**
 * 定义KES Plus 配置
 * @type { import "@kesplus/kesplus".PluginBuildConfig }
 */
const buildConfig = {
  define: {
    __DEV__: true,
  },
  title: "kesplus",
  router: {
    mode: "history",
  },
  access: {
    roles: {
      admin: ["*"],
    },
  },
};

export default defineBuildConfig(buildConfig);
