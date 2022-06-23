import React, { useState, useEffect } from 'react';
import { Redirect } from 'react-router-dom';
import MUIDataTable from "mui-datatables";

import {
	Grid
} from "@material-ui/core";

import PageTitle from "../../components/PageTitle/PageTitle";
import Moment from 'moment';
import { createMuiTheme, MuiThemeProvider } from '@material-ui/core/styles';

const getMuiTheme = () => createMuiTheme({
	overrides: {
		MuiTableCell: {
			head: {
				backgroundColor: "rgba(211, 211, 211, 0.5) !important",
				
			}
		}
	}
});
export default function CoursIntervenant(props) {

	Moment.locale('fr');

	var datatableData = [];

	const [donnee, setDonnee] = useState([]);
	useEffect(() => {
		fetch("http://localhost:8080/allIntervenantModule")
			.then(res => res.json())
			.then(
				(data) => {
					setDonnee(data.result);
				}
			)
	}, [])
	donnee.forEach(function(item, i) {
		datatableData[i] = [item.module.codeModule, item.module.libelleModule, item.module.estObligatoire ? 'Oui' : 'Non', item.module.creditRequis, item.module.niveau.libelleNiveau, item.personne.prenoms + " " + item.personne.nom]
	});

	return (
		<>
			{localStorage.getItem('id_token') === "DA" ? (
				<div>
					<div>
						<div className='row'>
							<div className='col-sm-12'>
								<PageTitle title="Liste des cours et intervenants" />
								<Grid container spacing={4}>
									<Grid item xs={12}>
										<MuiThemeProvider theme={getMuiTheme()}>
											<MUIDataTable
												data={datatableData}
												columns={["CODE", "LIBELLE", "OBLIGATOIRE", "CREDIT REQUIS", "NIVEAU", "INTERVENANT"]}
												options={{
													selectableRows: 'none'
												}}
											/>
										</MuiThemeProvider>
									</Grid>
								</Grid>
							</div>
						</div>
					</div>
				</div>
			) : (
				<Redirect to={{ pathname: "/app/dashboard" }} />
			)}
		</>
	);
}