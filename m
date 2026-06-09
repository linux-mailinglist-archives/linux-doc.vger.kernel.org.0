Return-Path: <linux-doc+bounces-91511-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kV2rC9+OJ2qOywIAu9opvQ
	(envelope-from <linux-doc+bounces-91511-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 05:56:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 835BA65C21E
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 05:56:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=QW9jh64t;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91511-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91511-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53DF0301E23C
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 03:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FB63BF67E;
	Tue,  9 Jun 2026 03:53:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB7B3815D9;
	Tue,  9 Jun 2026 03:53:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780977236; cv=fail; b=VarOSmTWKEq60is5Fx3K6TQKpVMZ5cLX1NWQ/QI3RvmZkUoEYxzuiAinYPYeXh2r3jp8GaLYPA6Q2X40PYlZg9FO2kLmyX8cOheqI00sGgXYsHmrbChSZ42UKZqZH4WzLqcu2MOcdG5ctewqETu7MuonFUqN5efmb7tNO0hSmMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780977236; c=relaxed/simple;
	bh=29spU32gP0NJSkxsMed7YmDdkTVsT7yf65GhyDmUwYY=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UjvqSBnjUfivbGYu4ad/9lS9mC+9A8sZoxstdl6yNCk+jnenZusJrmf0qAzdBPxTciRKw+EBXrtEFm9WEkiie3wvrJknHJo/FoY51yM6PEYS/A377FuYhpDMfgHhstYX/145rn8QvMcuQAyalbpZTGeSUsfnA/heBNIKivkZJ98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QW9jh64t; arc=fail smtp.client-ip=40.93.194.46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+MTiai5PZBY0g0asktAE7Qx0KJvbB6lLzidcXJFeoiKuOr7DkewzTsVXDG9Phyr7JVB6rjqU1p+N7DW6obMg+ecf3vQQLK9zcPNA4hmMfL3QNt+tdlc21WWmF+rSzojHGTokd/syqIbaWzLo2Csewzy3uFMRcYVSN+iXMXCrceBN5lC6jZHj9ZcCA5P81nN5aY+ociIRo4SlWq8SPOzeqepF94jdAoiL1mz47JT7xYCpotCjRP3hzED/qygOeiMGE0l7fCU8zZ8mKDf27mbdFcGT4d4ONjeKXwzvU7cKDR4ndwOpVIxzN5O6QPJElLBE4ZZdEJwMKAvKOfOcdCvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhW868Xp6mP77t5wirse7yDQXlbkDUs4be2za0EXcJU=;
 b=GVbeNvkDQdnslZ6AWQTaWzBx31gJ5+32ecBxxfl2vFEWIzg5SJ07hg/RjeRmmj0S3JYVSAXy/JcF8abS48yGdrZH6c4oAEWIg6v6jM4cdWuneTzG926MSSxSbXT1QBc+9k7eznH7R2XAqW1wlPr31G5G/GL9NpdKhdIgYp87fJgnET5zHHw+qURJp6acO5oabf6NDqCkXvtpV5mxI+CdspaXdpIJnwKbesZdjxDeh2DhSu023RGqhUAEh376VqkmGFvY1W3A1du9/ZpIpQk6ynvWSwQSr4iTnw8h+6D67fjsILEUnUiA82uyoUABRs9eP41DzaN8XnQ6CLRMQ+naDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhW868Xp6mP77t5wirse7yDQXlbkDUs4be2za0EXcJU=;
 b=QW9jh64tiJPKzW4+MKENhYRGCX2rBUBLuapraMFHZtz8fgBkdBIs8Mex+2gGNw5Op28OR+lTlvu1DIgv5vycQoCxYPIwNffveNn211QQZlnIgIZ/ulsRaOnxAPNHfF3RJ9ek8sXoF9sHqf8r8t+7Vz6Y5AwySoNeMbRWWT7h650=
Received: from BN0PR04CA0012.namprd04.prod.outlook.com (2603:10b6:408:ee::17)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 03:53:44 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::72) by BN0PR04CA0012.outlook.office365.com
 (2603:10b6:408:ee::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 03:53:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 03:53:43 +0000
Received: from BLR-L1-NDADHANI (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 22:53:39 -0500
From: Nikunj A Dadhania <nikunj@amd.com>
To: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, <kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, Paolo Bonzini
	<pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Ashish Kalra <ashish.kalra@amd.com>, "Michael
 Roth" <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, "Isaku
 Yamahata" <isaku.yamahata@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH] Documentation: KVM: Synchronize x86 VM types
In-Reply-To: <20260603114504.814647-2-clopez@suse.de>
References: <20260603114504.814647-2-clopez@suse.de>
Date: Tue, 9 Jun 2026 03:53:36 +0000
Message-ID: <85bjdkjrnj.fsf@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 162ff0f0-4329-49a8-98f2-08dec5dab33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PHLTkDkU0koj0omFEu32bcXylDEBgIxjFHxcENQRvd5IfJDQ5wmTAURQ+UM32+MB6qVxsPAuqH1G4lNaJjJQiC9clEwnQSmkvT6LfhodHI6SXb8Rq5xLB7J16Ajd/bdRecHykQuzaJmw8fqWrMyKOBvVctG5BWU6lt4z3YmOyRkMqAUQNF71OwYScZFlk91XRKvaISaR1dkoIoE3PHuyPdjFeXCOZaFDdIHtOKufMOB5aa1Am1Sc8gbBXC1T7Tt8CdIPnU/hxmcBAg5k0aU/D3aOQonQuPR8aiKW+rO7ZpHuNWDlb3OGOpRafMU3BTfhzt4nQlv/0gZmUinV842f4OhLNW+1UafAd8aovtau+dlyN8O+Wwe3uPV1yFjo/mRkppPT0TTyhDGccqA/PSgPfa33XXGo4PCS0HzwRHD08TT6EpgDWM9qcoz2ySU4ohb4nNzzQZFt/1AZfuasu/dMqTE2+8Zd2jq5dkJsOyx2cDIjxgbcZoNm4vVwWlCvdl5iqA6p0hTjwezIU7uuii7iXuplyNulNkGmB6b7PrmqMbpm3qcJ2w1J6sm7n9IifbChQ1heiOJq/J9q5JpNy3fZ1o5xYOafB0JD4byVvUNqX+GdhwnX8PLMVfjoa2wnq2660RhoATo/ULQk+k2NUH0o2p4VxSuhyWf+su/2ooNDEUS/3wCo4Y2KNwMfMtYVfGe8WGGXn4eXJeQv2E9NTr6YlapxKpSqZcgxPJxs2vPMWq8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N4Ts7INwN0Eme6PqLOCyGCvezqpFpxem9RmVpSOSZO+Neg1P6rohlNa6ZMaRavA+6ouYPmropbWmSGK1zWSvDkPBZS5vuhCMMbBbrjHFvni539mElzFqMWUADdwP9XcWTxYtV3OY5Agd5jq6KmTcPT3eeRZuOcX814m0HJXgIBRUyno2ur5+48icujscJDN88rGGhja/Zwe/hECMNc1sL9/8qXP13JuNLBCvP2kLoS1XzWvCH85J4O/doVDJPcQi/VhXhuv+CQDgiRhyO27/5eJXG85n2ziojSBR4isOQpkk2EfdGn+xLDYz6F65DFxOrRUveo6QX2kR3OiQ/jk3OSaFj0xcz47XsHLJzms3HMex13QznY2YHcR3EiZTBl+lckldCj6pEVOEOQAAuJDhlr+GXdTlN7ot7BVWkFDlzm66kwzxko2glwF5UZScfAJe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 03:53:43.3624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 162ff0f0-4329-49a8-98f2-08dec5dab33f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91511-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clopez@suse.de,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:brijesh.singh@amd.com,m:isaku.yamahata@intel.com,m:binbin.wu@linux.intel.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.de:email,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[nikunj@amd.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikunj@amd.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 835BA65C21E

Carlos L=C3=B3pez <clopez@suse.de> writes:

> KVM has reflected KVM_X86_SNP_VM to userspace since 1dfe571c12cf
> ("KVM: SEV: Add initial SEV-SNP support"), and KVM_X86_TDX_VM since
> 161d34609f9b ("KVM: TDX: Make TDX VM type supported"). Update the
> documentation to reflect this fact.
>
> Fixes: 1dfe571c12cf ("KVM: SEV: Add initial SEV-SNP support")
> Fixes: 161d34609f9b ("KVM: TDX: Make TDX VM type supported")
> Signed-off-by: Carlos L=C3=B3pez <clopez@suse.de>

Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>

> ---
>  Documentation/virt/kvm/api.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index 52bbbb553ce1..3ec574a41f60 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -9363,6 +9363,8 @@ means the VM type with value @n is supported.  Poss=
ible values of @n are::
>    #define KVM_X86_SW_PROTECTED_VM	1
>    #define KVM_X86_SEV_VM	2
>    #define KVM_X86_SEV_ES_VM	3
> +  #define KVM_X86_SNP_VM		4
> +  #define KVM_X86_TDX_VM		5
>=20=20
>  Note, KVM_X86_SW_PROTECTED_VM is currently only for development and test=
ing.
>  Do not use KVM_X86_SW_PROTECTED_VM for "real" VMs, and especially not in
> --=20
> 2.51.0

