Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2861D7051BB
	for <lists+linux-doc@lfdr.de>; Tue, 16 May 2023 17:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233951AbjEPPMs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 May 2023 11:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233481AbjEPPMr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 May 2023 11:12:47 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02hn2246.outbound.protection.outlook.com [52.100.203.246])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933965B80;
        Tue, 16 May 2023 08:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD0rvsyrk8GWa1B1jjpMR+qxPtpzNc2jxRi2Wfm3w0U=;
 b=LcsfTcOCE/bqoqpdIqYwp//PY47OKa1maIq+rXtuO+mDNT9Q9WrabY/MxryMlXiDVfgxiz/ALSRwInpn+VLYpIwqN50SiTfBTuGii+suucP7kcd3/n/hIzjMGbQ7v5TiwjQXKvjYgsG7LR6YJk43v80TOuZDCiBWpEftxAOKLyj9zLCtHmP7EbQGHd4TUio6TuRljLRfQYOAx77Z/JB9azqO0++1r+U9PV5wydolVgK25fvmqxVeEQtixxsXXFj20vuhi7TsOlzzeyKGn/09nyQGGPzkFvHZTPQ4/AM+9MRt9uvaFF86972K3no9gQwnpTwE60knCQ7+cUmkfVGp5w==
Received: from DB6PR0301CA0007.eurprd03.prod.outlook.com (2603:10a6:4:3e::17)
 by AM7PR03MB6136.eurprd03.prod.outlook.com (2603:10a6:20b:134::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 15:12:37 +0000
Received: from DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::34) by DB6PR0301CA0007.outlook.office365.com
 (2603:10a6:4:3e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32 via Frontend
 Transport; Tue, 16 May 2023 15:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 DB8EUR05FT054.mail.protection.outlook.com (10.233.238.111) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.16 via Frontend Transport; Tue, 16 May 2023 15:12:37 +0000
Received: from outmta (unknown [192.168.82.140])
        by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 23BE820081128;
        Tue, 16 May 2023 15:12:37 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (unknown [104.47.11.108])
        by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 6554020080073;
        Tue, 16 May 2023 15:13:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUnOwKLodz4/cWFjMsFbmVO+/gSjpBydO4HunMk3QBSvV8I+uWaRv6zmo9BJvoLE96ACPan6+mYgECBcqgP1zCzZPBRJJrgojqEI9XJkDuFzTmAGN3ZNWyEi1rSuw32oM1qTCBrZLloTZtYBx440ZwBmlXh/POw4O+JvgVuXttdlYbe1iZhPUlCztxWAkP8561+MhwWIOCHS+VqYEvH1dcvis54o786HkDpC0PsgtX3Y+tj4GRrpqCQ9I2rcDkX+F44LkHm4g6FCBprJoXQZge+UIPcUxt2TP7EdfvkYuX03duUajLdWY9298UD8G4i5o1U6qbSSJtxWAZWVt/d9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD0rvsyrk8GWa1B1jjpMR+qxPtpzNc2jxRi2Wfm3w0U=;
 b=Z7intZBTHCX1OtXTUfqenpHkuRWYKS9d0am6VygcgAgunwA7uvVcyY7Bg6WYntQJyHPi4utR53z2+HpwlPs3RhY0N/2Pi4zfbjONZOFkGpk2q6UBXPi51zxLffsabGsvdPPyepuM4L57vJm41pQ/yZrEvUmPSCF4MZ77nwZcGmjnDamiL6K8Xy1HzXfrJRfGHzkx14EGGWsGPdN8hC5pl55CXxiptTrt23YuFNQJmFRduv/5EwSj0btXoEXEgUev2PdC62NPgksRW4xVaKpZ8Af3OkQ51junJGt+gCLx6J97XK7qDXAqZvNklHDVoauzPQPdQfH47ac+kcVSAtPszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD0rvsyrk8GWa1B1jjpMR+qxPtpzNc2jxRi2Wfm3w0U=;
 b=LcsfTcOCE/bqoqpdIqYwp//PY47OKa1maIq+rXtuO+mDNT9Q9WrabY/MxryMlXiDVfgxiz/ALSRwInpn+VLYpIwqN50SiTfBTuGii+suucP7kcd3/n/hIzjMGbQ7v5TiwjQXKvjYgsG7LR6YJk43v80TOuZDCiBWpEftxAOKLyj9zLCtHmP7EbQGHd4TUio6TuRljLRfQYOAx77Z/JB9azqO0++1r+U9PV5wydolVgK25fvmqxVeEQtixxsXXFj20vuhi7TsOlzzeyKGn/09nyQGGPzkFvHZTPQ4/AM+9MRt9uvaFF86972K3no9gQwnpTwE60knCQ7+cUmkfVGp5w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7396.eurprd03.prod.outlook.com (2603:10a6:20b:26c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 15:12:34 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 15:12:34 +0000
Message-ID: <28a625b1-a125-1b74-f832-807159e2295a@seco.com>
Date:   Tue, 16 May 2023 11:12:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 07/15] phy: fsl: Add Lynx 10G SerDes driver
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-8-sean.anderson@seco.com> <ZFi/Y7wcad4hrAMe@matsya>
 <957a6bb4-f07b-f511-72c9-da4199dc8616@seco.com> <ZGOG5iwINTcFABHB@matsya>
From:   Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <ZGOG5iwINTcFABHB@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:208:32e::16) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AM9PR03MB7396:EE_|DB8EUR05FT054:EE_|AM7PR03MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: a6cbecf0-0111-487f-3543-08db561ffc09
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5dH8/igctCK2CSySF9I4ewSpyT7UnnjP5khffKQk9CLCHuLoK/9+zhN3EmFedDv47n9BSG2gGEyAsHSEzdT3oShUippyete7pNLN9c6nqm0NgK9jznwnTFRO+D5Kbq3oXquLrVIeeslmVc8Gyrpb/V7sqOwwao++wcIETm5KQK7BpQReP5m92I4TCmp1bVMpqldz/rvR5l9zzIdAP4Yi7uL+MO50KjCldvpynrrKkOF2SC7ZMjE+muG38FXTAyVoYUbza6kEv9FmvFkFVhXSzpQyjGCkuOxcEpcKwTzFLKEaP2ve5Yna9cYsBnoINWR1rl9m1pQ6FXMHcxibhUwzSvdRj/weVu9UZLAdPUpotWdCKJQa9invqoRh3xCmol9XC7xmAqsKvKNtQySk4fJ8yhjzUgM5ehJrvatsEG5zxJ5JA/k1bUeHszx7LWyUB5J/fwHkV8R80I0p+BADFrgTxvQzCYMTeVgtE8gHk2zvq1ZVSfjvePIqc5Z5VUiSPS3utI8EH4raRg5U7eEjC0/G7f/L2R3xC2x+wHpVxdb1wletUcRXGGErpd8Ak62WzsoiQUf1JtUwZEy7esr6b92EGm2dDLzaJfafEpIKdXIfWAMR5OrnNQfwcGchg0trlRCxY/t2b10/MOQuDtqDyTx3u5m7RNgG098WiuKPvDgYvHXj7TBwaorr7PU+Fx/24UNpOsEaAgAFfqDz0UEx77RGMA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199021)(2906002)(4744005)(478600001)(41300700001)(316002)(54906003)(44832011)(7416002)(6666004)(6486002)(8676002)(66476007)(66556008)(4326008)(6916009)(66946007)(5660300002)(31686004)(8936002)(6512007)(6506007)(26005)(52116002)(53546011)(186003)(83380400001)(2616005)(36756003)(86362001)(31696002)(38350700002)(38100700002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7396
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 78d85e45-6e63-4aaa-36dc-08db561ffa2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KTsx3cXwkQXY0ZNoGZOdZiW0MnTcDa9crp5dW10lX0G+SoQa611G4GjPwLqB9K5cs1im+ZBeLevr7FPtn0em8mcgNikqYBe7/IKsOhXVAbbMtH/4F2uW6WwVnOwdhNY8WAZsBrBSup59QHQ4MbYf2WVXrtw30kQKA/p7YSPD9pKEjlmleIuINNxtPJIY7dmQEEw1oWYIIxKN8t0WYNrxzfZTQ05qYcdSvXGBp+7PchAaqgAP6YwXhzqxDSjmb8cHOg/50JDpTwxc92BjJYwqHpwGPsn+b+qZs8dBgXs2BhE7sBirty+yK8pfq4OKgN3R3MOWgjsRKGlUiDxok2Gv2CGoeCHCVbEI58LTCNpEX1onx9FrWk1dz992yg9LTMOr/RfCIDp1Xe/0xHhi60TNtnF02J152capcheNqs2HeXmcXOLM4GvurUy/JsT4VFpwEKMU2psyUafNReT7i1eb8mzsYBCC4YA1uV34crAuQDrwijTyWRpqpKrCYYeiL5Vkv+2VutIf0PAgXHXl+IFKmQwFtQZOW4MoiOnWYsQ8h06iYnRkV0H7sttpGsBmdsgtZCTT4O7SQ6dXsRuF2EBhjkMlAB5RxZkbjllbWNapPJxy2nT21t5JVlfH4lZC1385Bz7sYwaQxm+AP2HhGNt8+ZKHZTb3kwWQjS2qGJUsq/QJuoM4LayP576fn6XhQNPvFg9eHM7aCz2vJu6EMqMv7tYptmyxsIt227m7fCmM3TMWmUdKaqLiVLoOzynE5nGkp6pHIQKPr+HF+fXYTyoOIxVyIxg7MJQMrOXy9/Alj7afyp4AETqqqQNEDNZGGF+TT1SAXriz31PGcwI5e29D5g==
X-Forefront-Antispam-Report: CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(39850400004)(451199021)(5400799015)(46966006)(36840700001)(31686004)(70586007)(6916009)(478600001)(70206006)(4326008)(316002)(54906003)(86362001)(31696002)(36756003)(47076005)(6666004)(83380400001)(6506007)(6512007)(26005)(336012)(36860700001)(186003)(53546011)(6486002)(2616005)(2906002)(8936002)(41300700001)(44832011)(7416002)(4744005)(8676002)(5660300002)(82310400005)(40480700001)(7596003)(356005)(82740400003)(7636003)(34070700002)(21314003)(43740500002)(12100799033);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 15:12:37.4712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cbecf0-0111-487f-3543-08db561ffc09
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6136
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/16/23 09:36, Vinod Koul wrote:
> On 08-05-23, 11:28, Sean Anderson wrote:
>> On 5/8/23 05:22, Vinod Koul wrote:
>> > On 13-04-23, 12:05, Sean Anderson wrote:
> 
>> >> +static const struct lynx_cfg ls1088a_cfg = {
>> >> +	.lanes = 4,
>> >> +	.endian = REGMAP_ENDIAN_LITTLE,
>> >> +	.mode_conflict = lynx_ls_mode_conflict,
>> >> +	.mode_apply = lynx_ls_mode_apply,
>> >> +	.mode_init = lynx_ls_mode_init,
>> > 
>> > So you have cfg with mode_xxx pointing to same functions for both of the
>> > versions you support... so question is why do this and not call the
>> > functions directly?
>> 
>> The intention is to make it easy to add support for T-series processors,
>> which have a different PCCR layout.
> 
> And when is that going to come. I would prefer this to be added when we
> have users being added
> 

*shrug*

I can call them directly if you like.

--Sean
