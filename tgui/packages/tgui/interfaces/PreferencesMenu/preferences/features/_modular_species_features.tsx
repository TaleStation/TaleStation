import { CheckboxInput, FeatureChoiced, FeatureDropdownInput, FeatureToggle, FeatureColorInput, Feature } from './base';

export const feature_head_tentacles: FeatureChoiced = {
  name: 'Head Tentacles',
  component: FeatureDropdownInput,
};

export const hair_lizard: FeatureToggle = {
  name: 'Hair Lizard',
  component: CheckboxInput,
};

export const feature_tajaran_tail: FeatureChoiced = {
  name: 'Tail',
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
