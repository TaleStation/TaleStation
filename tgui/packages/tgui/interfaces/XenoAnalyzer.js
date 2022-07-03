/* eslint-disable max-len */
import { useBackend } from '../backend';
import { Icon, ProgressBar, Section, Table } from '../components';
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
    plant_desc,
    researched,
    plant_appearance,
    max_water,
    max_nutri,
  } = data;

  return (
    <Window resizable title={windowTitle} width={1000} height={500}>
      <Window.Content scrollable>
        <Section>
          <Table>
            <Table.Cell width="40%">
              <Section>
                <center>
                  <Section height="320" backgroundColor="black">
                    <img
                      src={"data:image/jpeg;base64, " + plant_appearance}
                      width="100%"
                      height="100%"
                      style={{
                        '-ms-interpolation-mode': 'nearest-neighbor',
                      }} />
                  </Section>
                </center>
                <Icon name="lightbulb" size={2} color={light_level ? "green" : "red"} /><font size="+2"> Lit</font><br />
                <Icon name="circle" size={2} color={researched ? "green" : "red"} /> <font size="+2"> Researched</font><br />
              </Section>
            </Table.Cell>
            <Table.Cell>
              <Section title={plant_name}>
                Health: <ProgressBar value={health} height={2} maxValue={100} /><br />
                Water level: <ProgressBar value={water_level} height={2} maxValue={max_water}>{water_level} units</ProgressBar><br />
                Instability: <ProgressBar value={instability * 0.01} height={2} maxValue={100} /><br />
                Fertilizer: <ProgressBar value={fertilizer} height={2} maxValue={max_nutri}>{fertilizer} units</ProgressBar><br />
                Pests: <ProgressBar value={pests} height={2} maxValue={10} /><br />
              </Section>
              <Section title="Description">
                <font size="+2">
                  {plant_desc}
                </font>
              </Section>
            </Table.Cell>
          </Table>
        </Section>
      </Window.Content>
    </Window>
  );
};
