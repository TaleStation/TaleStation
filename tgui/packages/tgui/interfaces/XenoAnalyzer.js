import { useBackend } from '../backend';
import { ProgressBar, Box } from '../components';
import { Window } from '../layouts';

export const XenoAnalyzer = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    aaa,
    color,
  } = data;
  return (
    <Window resizable>
      <Window.Content scrollable>
        <Box as="Test" m={1}>
          {props => <ProgressBar value={0.6} />}
        </Box>
      </Window.Content>
    </Window>
  );
};
