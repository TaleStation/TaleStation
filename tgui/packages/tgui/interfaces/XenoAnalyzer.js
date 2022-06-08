import { useBackend } from '../backend';
import { Box, ProgressBar } from '../components';
import { Window } from '../layouts';

let windowTitle = 'Analyzer';

export const XenoAnalyzer = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    health,
    water_level,
    instability,
    fertilizer,
    light_level,
    pests,
    plant_name,
    researched,
  } = data;

  return (
    <Window resizable title={windowTitle} width={1000} height={500}>
      <Window.Content scrollable >
        <Box text={plant_name} width={25} height={30} />
        <ProgressBar value={water_level} width={5} height={25} />
      </Window.Content>
    </Window>
  );
};
