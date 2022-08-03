import { CheckboxInput, FeatureChoiced, FeatureDropdownInput, FeatureIconnedDropdownInput, FeatureToggle } from './base';

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

export const feature_tajaran_ears: FeatureChoiced = {
  name: 'Ears',
  component: FeatureDropdownInput,
};

export const tajaran_snout: FeatureChoiced = {
  name: 'Snout',
  component: FeatureIconnedDropdownInput,
};
