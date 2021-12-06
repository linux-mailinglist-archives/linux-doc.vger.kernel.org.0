Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DA046A4AE
	for <lists+linux-doc@lfdr.de>; Mon,  6 Dec 2021 19:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhLFSiM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Dec 2021 13:38:12 -0500
Received: from mail-bn7nam10hn2201.outbound.protection.outlook.com ([52.100.155.201]:63553
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239007AbhLFSiM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 6 Dec 2021 13:38:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h06FB+u/yVVPT+xv8lYoxEdm8OL5wInC7fZbgyQNeKCh0oQOUytkJo7HfMKZ/yrsMh+D1EprMuvuelyjrQGgg5c5g9oIyj+c+zjrL2+xiu98u8jh3q5hD0NI75WexE/7hRTCWMEPh9Omdv0BMBG50iPICSt8OxCtsKpyzw/iNawC0r2hELGSsiVIgvt5Zt84C5WYqC2sAJlu5C68UQonUpZacDxqkG0xMOqTjhTii5u5twnI8kSgsc0XVQ+29MkYgTb85ByOEViEwYlbHg/IKn4slcGdPhoosfluBd6EvK0A5OycTlgaon5EIW2pfjxJAC1XizeIK6CbMiOzP1YoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=AKjuNQK2xzvsrCxTF0hOnqKEMiqQTthUy4OoNS/+7K10f1pIFDnm5woEXg+y9vinNOswodMF4eHtEf5NlvRRNOyWowPN9Wip6kMJtVZAwWwpUmooNQpJdOJcJ5LmPHh9LHJnmYSUO1iPC/Q1TmVU6V59D/KBRmlf+JAS71bNU6lDgMweuQA4GGxDK3pk4T3nax1JFkhwt49UK8sSJY0Cnc++AgISMOit5ON4MUTS5kfWmBSvp7iVa9+N5ZjKqNAtnal1kfDoatUKnZlMxbLap5ZzEUCo3EDLhVt90lANTaNNeZkiJnNMaKm4TRAQgnJHBLIegixgFUykdddIv6KaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=responda.com smtp.mailfrom=msn.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=msn.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=loh6EGIxLzrva1tEtF9rJO9O50j/VRdpzA71JlZ44GOETztPFKUIZO/5D6lzyj0eTqHFvbIHXKrU0njzvYtpPWHa1ICvMFXYirZWj3Q77OD48jvYWsEbkfoUrUeO3Kn9QD3Su5UraadBLLNilRDqLLwUp/0KYoFWUCyYqv17XPQ=
Received: from DM3PR08CA0004.namprd08.prod.outlook.com (2603:10b6:0:52::14) by
 DM8P220MB0655.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:37::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Mon, 6 Dec 2021 18:34:34 +0000
Received: from DM6NAM04FT022.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::bb) by DM3PR08CA0004.outlook.office365.com
 (2603:10b6:0:52::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 DM6NAM04FT022.mail.protection.outlook.com (10.13.159.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:34:33 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 93653951A4;
        Mon,  6 Dec 2021 13:33:58 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:33:16 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <c5560a22-da03-47f7-92e6-8aae034be43f@DM6NAM04FT022.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ea8473-ccdb-4fe5-258e-08d9b8e70caf
X-MS-TrafficTypeDiagnostic: DM8P220MB0655:EE_
X-Microsoft-Antispam-PRVS: <DM8P220MB06554BE536C7B29AFAE33F41EB6D9@DM8P220MB0655.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(508600001)(86362001)(82310400004)(3480700007)(356005)(2860700004)(7366002)(7416002)(6200100001)(7406005)(6666004)(47076005)(2906002)(8936002)(5660300002)(316002)(336012)(26005)(70206006)(35950700001)(6862004)(82202003)(40460700001)(31686004)(8676002)(7116003)(83380400001)(9686003)(31696002)(956004)(786003)(70586007)(7596003)(6266002)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHFCK2MrZU5JbnpNTEtCUXFRTExmalZwelc5YmdZWUlCVXdueERaVndmZTRa?=
 =?utf-8?B?TnlQWTZ5emZsVDBKckxYTm1SV1pOemZUcm9ZOGEyb3ZibHl6Tnh1dXZHUHhx?=
 =?utf-8?B?TnRLTTQ3OVhESEpFekwxS0VvdXgzZktxUVRza2Q1alRsanFuZVY0WHpVOTF1?=
 =?utf-8?B?eXRLaEh2VXJsai9RK282UVVOQWxZZGlMWFNqSmVqci90SXFaZUJRM1VoMnhH?=
 =?utf-8?B?RnNjTW45eTZ2clJZRllKZjgxbWh3MkI4ZzNOUlYwbnNBbko3Vk1IdG9MZkEy?=
 =?utf-8?B?cVFMQ1poVFRzcWJDNWF2dEFyNVZoVVJtNDhoSmlMV0hTZUlvTENLNjB6UzVE?=
 =?utf-8?B?NnM0Z2JJcU5rVjhVWWJ6QXRwN2lEQmFFaXVUZmtjbXVxd0dlNXkzczRTRmhH?=
 =?utf-8?B?bTdBMzRSMWFoTXNCUS85N2tDVjZhU2YzMC9YRDU5VitRVW1HenVUeWZMemY5?=
 =?utf-8?B?dkV1dUVOYXlleUtZa3JFRnZoWHFackxlblJ5bVgxMGxZaWhBa0g4a2FsZVk5?=
 =?utf-8?B?S01ZUkRaV3NUVHNPZkFiQmxzelBGcXgrVWlaRmZlOGhCNHR4UzF5TTlnMzBO?=
 =?utf-8?B?OTdzcmg0ajZKTFBMcWlEcG1qMlBCNXM3bXdXZysydDNVNjRiR01yWXZJSEI0?=
 =?utf-8?B?U295T3FpQ3VSNFA3czBRcU1Ka0Nidk4reVdtSkFPc3RYTGJ2RXZuQkNMYnRH?=
 =?utf-8?B?TGVUQ0JBRVRQTXYzOFpxbTBJQkhsWi8zMDNtVzhvK0trZE9BUDdJQk5QL1VH?=
 =?utf-8?B?eUFneGFlSDZNVm1ZS3F4WDZpZUNtQUZqRUF4VXU3SElQY0NiZ2k0Um9OdHlF?=
 =?utf-8?B?ZkVyRUZab2RQNnNqdEpKRktiR0RUL1Bxc0tFbjFxRGVCYVNGUXJ0SDAvRHow?=
 =?utf-8?B?aWpVZW5XeDJMZ1RFRkhjRGJqZk1GSWpOY01HaW1TSWNkQ3J0TE1tbTAvNkRH?=
 =?utf-8?B?NW9iNWlOQ285LzljcTRtT0xaczgzeTFzamhQdGxLRUVoRGl0enlhKzBTT1Zo?=
 =?utf-8?B?YXlBenRkSjVOMWNoTm9jUEZWUHZ2VGRrb2FDUm1wNE1rd0F2NzNIaXVvRjA2?=
 =?utf-8?B?OStnVUszc3A5WEhuZm1CTVlycUJCTDkzUFUzNng0dDhLclBVUW5qeTJHdHFm?=
 =?utf-8?B?OVBpNno5WGwxYXJoYjQzOE52VmVWUlJ4RHdhWGpDM0dsU29kMENxd2VncjJs?=
 =?utf-8?B?YzArSjR3ZjExRENRSHJtODRQV0UwYS9Mdi9rUGMxdGx1bW52Y3cySG83ZGc2?=
 =?utf-8?B?amJmVlZxblZTYUkvM21TU3BTdjU4Smo4Yzh6dXJSTEtwNkxOSlNFKzhBejQz?=
 =?utf-8?B?MEFjTFVjL1MzMjJUT1FRM2V5eS9mRE1MZUgvangyRUNDZVozUWFWc1piR2Ur?=
 =?utf-8?B?NGR1Q1M2Sk9veVV0cFVjZmhhMWpGREpQMGtxMVJ1S1NmSVh0YnZqdUxDZk82?=
 =?utf-8?Q?1HV8LqxX?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:34:33.8147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ea8473-ccdb-4fe5-258e-08d9b8e70caf
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM04FT022.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P220MB0655
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
