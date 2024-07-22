import type { SidebarsConfig } from '@docusaurus/plugin-content-docs';

/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */
const sidebars: SidebarsConfig = {

  odocSidebar: [
    { type: 'doc', id: 'odoc/odoc', label: 'OCaml Packages' },
  ],

  mylibSidebar: [
    {
      type: 'category',
      label: 'Mylib',
      items: [
        { type: 'doc', id: 'mylib/hello_mylib', label: 'Hello Mylib' },
      ],
    },
  ],
};

export default sidebars;
