Return-Path: <linux-doc+bounces-37025-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAE7A2924B
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 15:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 322807A10D6
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 14:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E601ADC7C;
	Wed,  5 Feb 2025 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KgKjQzQk"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546471519A9;
	Wed,  5 Feb 2025 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767424; cv=fail; b=R+Gntdb7Wbc7zqoUom73vgm19CR2xW/FfCsL1oja3mdpvyh3nLiQK6hvF8ta6JX/jDZPa2M/HkxTb/HdfA/dnsROihTkrY4ASvIktI/RSr/opxCcyi5clxleA9hFJ5xuDZLD43KdAUJuUZAqMFsmBYT/il8djRL44rMfv3exkcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767424; c=relaxed/simple;
	bh=zgVmQKjynIWNxQJQVKVsQVomdkAZ1WzSBYDaGO3tdJI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BshjDUGWhADi/lSpEqOANG8Aq/a67I0gzakHEApjKEaJwSay7chOdEzuPRTWbAzUsLAidiCDBBRyG+3H1a0qGFuYsfMsHyJXoQS0HEMpepcfaO1hcBRB3FSPoOo6+lAaiAWczZPG0xU+/XzHupjfuhjClIFrW/4dttZp/4/5Cz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KgKjQzQk; arc=fail smtp.client-ip=40.107.100.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8+HxT4QCVPX5xGK0DJe9HV33Y9d9y7lpoOezg4tO0lZ+5XOUAwTxzmU9L4S5wNjQ+N+UZrb1aW2tzGgO1cSIVGy1MqFGS8DLU43DuMgywgRwcMXO6EoON55jA6c1xpRqxsNZ23Y0WafpjOD+KYegcj4KRdHSpW9fdeqt9t/sa/dimAPlLry0TWpsiE+CR8xw7oo87v8xy9Fak83MJc0oFgHB50FU3/+piV1PGV4EWD6Ktssg/3m8UiRjn5GJ/WTYAwCzaci0dcxdbl1W/WFaPiSiJlNFtHgbaedjzDg9V8q7Hp99eQgTlCrLOMlRXnmJcV7OpWiljpQ6eo5TdgvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgVmQKjynIWNxQJQVKVsQVomdkAZ1WzSBYDaGO3tdJI=;
 b=AVMmkkzV3ToyhVfkJaGtB3p18fks6hs9t6UkfjlNoZVlwsOf+Id0ndjqYDxLU0tublbi/QwRtQUOVq4t0VrfY+KwX0oN57wCMBpq5l8qUkzLRRNLIR0qWzjAvb+u5V/LpB+S+gCUpcmoEdt5V28z/XzHcDhbinOH4AZZXgio8LquXOdGNca1kfCLTJQyOZRwTVxD/oEoFblJfHCRadQarGZiSTXnOUj1KFruDMqFMP8V727EuEGkbp7nXaiVTzWiq24fBq5ZFODw/vFYHacMg5RRfkBNnRdPg73ZcXN3e2jcA+707aiSafQMafr5WUtq2CZPIF5zu2kdZZugczhWLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgVmQKjynIWNxQJQVKVsQVomdkAZ1WzSBYDaGO3tdJI=;
 b=KgKjQzQkGGU55psZmRxVZnXc9bw1PLErPelyIrqdoz0OKpEykJ7G3iIKWeURvx1+wZy0hZdbD1eB2WQGyXwOz7RmK0JpO2CMsiTx2eKTI8qlivc5wsv8uoWjUklH+YhQ6LYP1qD4su4FKRhfqua/4pHDGe7kwnteAkc7GY6hQZmGj+DSneQIV0RjC9k5zCrKJnodoaViV193lX8/M24rSduz0fraCwj4LudAjVeIkprqD0YHoiAsCuTzsW2ceEVengJrcCn9lFjp7+gGOY41Ak6VnuJQS+1O2AOL2eXpsPxh6+foUV83k8tCg506DCkRfHarvSIy/cXUnTbAv1pieA==
Received: from CYZPR11CA0005.namprd11.prod.outlook.com (2603:10b6:930:8d::13)
 by DS0PR12MB8480.namprd12.prod.outlook.com (2603:10b6:8:159::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 14:56:57 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:930:8d:cafe::72) by CYZPR11CA0005.outlook.office365.com
 (2603:10b6:930:8d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Wed,
 5 Feb 2025 14:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 5 Feb 2025 14:56:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Feb 2025
 06:56:39 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 06:56:38 -0800
Received: from localhost (10.127.8.14) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025
 06:56:32 -0800
Date: Wed, 5 Feb 2025 16:56:32 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Danilo Krummrich <dakr@kernel.org>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <corbet@lwn.net>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <ajanulgu@redhat.com>,
	<lyude@redhat.com>, <pstanner@redhat.com>, <cjia@nvidia.com>,
	<jhubbard@nvidia.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
Message-ID: <20250205165632.000016fa@nvidia.com>
In-Reply-To: <CANiq72mxKhCudmRaS=gwnC=gjkCLMhZcC2ZpfzKKaGX1Hivz9g@mail.gmail.com>
References: <20250204190400.2550-1-dakr@kernel.org>
	<20250204190400.2550-2-dakr@kernel.org>
	<20250205155646.00003c2f@nvidia.com>
	<CANiq72mxKhCudmRaS=gwnC=gjkCLMhZcC2ZpfzKKaGX1Hivz9g@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|DS0PR12MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ce732e-3448-40fc-cfdc-08dd45f55641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXBXRVVuWGFFcDZiaXBUdks2c0F5T3JVaGJGaW1uRU56dWlCMHFSQXVKN0dq?=
 =?utf-8?B?UXJISGg0ZThyN3Avakg5NU0zcUh0WnRqd2plb0JSdUF2b0dkRnZqeTBWa2x5?=
 =?utf-8?B?V08rOGZpZUJaYW9qQW5mWTZFYUNOYnVhSFUwVzROcTBsaGN3ZEEzMVFvbTFJ?=
 =?utf-8?B?SkZCTWY2NGRpVitOVytDVmpMSVNSbDhOSGhRMklKcGtsaUoxMW8vWW85WUVE?=
 =?utf-8?B?VmEzVU5VZHg5SHpJN0lUSkVObkVucitiZGVWOFVmL1oweTIzVHFqMTFaY2Mr?=
 =?utf-8?B?WWF3enBtVk40eDJHVklzd0QxM1I1ZmJscjdlRGs4RitzbU5odTcrcmFtS3RK?=
 =?utf-8?B?ckZhMTJHeG5zR1kyaUpKVWZEcW1yZ3VCeGI2b3R2N3ovb211RVhLQlRpL1Zp?=
 =?utf-8?B?STJlSnB6R3BucDJEeTQxN1FYN0o1Vm9qckI4eXNIRFBHQkhaRHE1K0xiOXJO?=
 =?utf-8?B?MUV3THZjajRrUUtLdXJOclFBblRvL3ljRFdDMGxSdlEyM001SG1PT0dPZmRh?=
 =?utf-8?B?ZFZ5SDdvMzFYaXpmbC92OTcvVVRHOHg1SGZ4YldwZnFoOFFPTTIvOHN4dWwy?=
 =?utf-8?B?SUcxMStPczIvZzBVUlYvcW0vdllIZ1BrNDJhbzFFUE84UlJ6SGQ1UU9XOGQ0?=
 =?utf-8?B?dXBjRkthZ0kvOHNEM09yZk45VFRxMzZlSzhZK2ZZd3RkZDVwNnRFc0c1YkpK?=
 =?utf-8?B?cGJlbGVXdXNSMkZqNnhYUHN5ZmNSTXV2cUloRC8vamZMUnZ2dTAzWSs5U3dW?=
 =?utf-8?B?S0hyS3drMG5ZTG9yWHl5bVBKSUdjVTE5UHE2ZHptdWRTVGJjYVpXZTVGSTM1?=
 =?utf-8?B?eS9idzZpNTI0aTduL2k3bUdOMUlpNHdvR3R4QjRXR1I0dDVtbTcvVDhDTVZ3?=
 =?utf-8?B?c0hnOTg2YXFaRlR6Z24xN3pZUVZUSUNmcDBOM1c4cStnenRrREhGRTJVZ1BR?=
 =?utf-8?B?Skl6TUJ0VU94YW1ydk9sM0ZXWThPU0V3bE5ONkZMdS9RTzYxeDlPV1E4YVpW?=
 =?utf-8?B?ZU5FT1ZQdEkvNXA3YkM3Tk5sbkVPZG81VDNOWU9hUWRwWUFSekcwNllNSWJB?=
 =?utf-8?B?Z2VFeFp1RVRWUFZ3LytPc2l0N205RlNJQ2dCdlJjUENVL0pneGhxOTJkbUpR?=
 =?utf-8?B?L0F5QUJuQUlqQVBpTmd0RmZvTy83WGhhM1dMb294YzhGc2F1TVRBU3d3RGRj?=
 =?utf-8?B?VFA1eEkwYzVGeXhTaUFJNFhQWXJBVGJnN1RhRWNrSTBPVlpqWkJzRTBaTVNm?=
 =?utf-8?B?dHY3ZFhrbDVWV1BaU2syRW1MakNQNVhGbHk0c3MrZWY1Z2ZYM3Z0ZzduSVJ5?=
 =?utf-8?B?c3lKYlBwMnZ1NCsrZzBZT1pXeTRpc3ZHVDZadmJwN3dXQi9QckJqL3I3MkxQ?=
 =?utf-8?B?M0NqVU8yVE16RUNYcHNJbEl5ZCtUWWhrSEZjeTZjMTBHZEhRdVhwRDVrSFRT?=
 =?utf-8?B?UmpPYjg2KzJPdXRBKzRoVXNjZ1ZFdE5OLzU0MG5Sa2NvRGNwOHdNMmViQjZW?=
 =?utf-8?B?cDhic1RVUlViRCtLQzZTdXVVNGhBbUVtbGxhdjczVkh1UXc0c3BackVPU2JK?=
 =?utf-8?B?SUNlaTVHQjI3ckR3dHR6MnpWWnhJTzdVU2NJa2IzVU92cDJURkdSME1tV0Yy?=
 =?utf-8?B?Yzd5M3RvY1lIeGNNTDNVM0t1cUtWTjNUQjRjNmFKN0xsOEphd3FiMVNFdTVR?=
 =?utf-8?B?TUZ0Zys4TDF5U0N6ZEw4T1JORGtNNkpEU1k4QThiZnYwUytKQU5rZC9xRUZH?=
 =?utf-8?B?R0NPTmpTY1dRU1p0ZTdDWitBUW9XUlh0NUtweEpNQmxIaWt0bHloeVJjUEVO?=
 =?utf-8?B?eGdXMFYrVUNYWnRpNlRyeXFZT2ZhRk5uTS9SdFZ4bEc2UTllQ2E0N3hlSTM5?=
 =?utf-8?B?VVEvZjV6UFVHZU4xWnZNenRkdnd0RlNTRDJBSyttdmdGZ1RTY1UzWStYVUdz?=
 =?utf-8?B?Ni9EeUdHblhjUXZiVXdXblI0eEpOQ0ZEN2ZHaExSLzlDZlNra09JL3ZneUtC?=
 =?utf-8?Q?ehEWSTvnhNFY00mB84pWEWhYSmpS5o=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 14:56:57.0592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ce732e-3448-40fc-cfdc-08dd45f55641
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8480

On Wed, 5 Feb 2025 15:13:12 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Wed, Feb 5, 2025 at 2:57=E2=80=AFPM Zhi Wang <zhiw@nvidia.com> wrote:
> >
> > It would be also helpful to make the process explicit. E.g. sharing your
> > command lines used to checking the patches. So folks can align with the
> > expected outcome, e.g. command line parameters.
>=20
> These two guidelines (and generally the few others above) are intended
> to apply to all Rust code in the kernel (i.e. not just `rust/`) --
> their command lines are mentioned in `Documentation/rust/`. We could
> add a note to make that clearer if that helps. So I would suggest
> avoiding repetition here by referencing those.
>=20
> We also mention it in our "Subsystem Profile document" at
> https://rust-for-linux.com/contributing#submit-checklist-addendum.

I think we can refer the links so that we don't need to explain the
process in detail. I would prefer to have the exact command lines that
maintainer are using in the doce. E.g. I was experiencing that folks using
different params with checkpatch.pl, the outcome, .e.g. warnings are
different. different spell-checks backend gives different errors.

It could be nice that we put the command lines explicitly so that folks
would save some efforts on re-spin. It also saves maintainer's efforts.

Z.
>=20
> > > +The availability of proper documentation is essential in terms of sc=
alability,
> > > +accessability for new contributors and maintainability of a project =
in general,
>=20
> Typo: accessibility?
>=20
> Cheers,
> Miguel
>=20


