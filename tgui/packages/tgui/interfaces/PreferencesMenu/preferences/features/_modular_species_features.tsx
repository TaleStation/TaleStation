import {
  Feature,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureColorInput,
  FeatureDropdownInput,
  FeatureValueProps,
} from './base';

export const feature_tajaran_tail: FeatureChoiced = {
  name: 'Tail',
  component: FeatureDropdownInput,
};

export const feature_tajaran_ears: FeatureChoiced = {
  name: 'Tajaran Ears',
  component: FeatureDropdownInput,
};

export const feature_tajaran_snout: FeatureChoiced = {
  name: 'Snout',
  component: FeatureDropdownInput,
};

export const feature_tajaran_markings: FeatureChoiced = {
  name: 'Body Markings',
  component: FeatureDropdownInput,
};

export const tajaran_body_markings_color: Feature<string> = {
  name: 'Tajaran Body Markings Color',
  component: FeatureColorInput,
};

export const lizard_body_markings_color: Feature<string> = {
  name: 'Lizard Body Markings Color',
  component: FeatureColorInput,
};

export const feature_avian_tail: FeatureChoiced = {
  name: 'Tail',
  component: FeatureDropdownInput,
};

export const feature_avian_legs: FeatureChoiced = {
  name: 'Avian Legs',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};
