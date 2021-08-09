Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99503E49E6
	for <lists+linux-doc@lfdr.de>; Mon,  9 Aug 2021 18:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhHIQcD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Aug 2021 12:32:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5738 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233002AbhHIQbt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Aug 2021 12:31:49 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 179GUxot023350;
        Mon, 9 Aug 2021 16:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=V1lQDaOMYztoSOPdP3Q6ZBGYsBEjTef5rLi89EbMBOQ=;
 b=KUNr3talYb3mHOBisTe1NnjhWT9K/T7yauFFnqMr7iquuL7D40D6dRxRaOTRuYPhHsVS
 LA/YQiwhBL0VUEtKYyGiAjctnfrRmB+f69AeG2bCAjl9QuW8yrE5YQfjeG2ky+APSQL4
 RH2/ToxLLz8+dKPJ7q/jgxRasFzMDYkMDobgV0n7vHOvq47XFSyW7DyWXK6x0pXGy9fv
 tSdY02mw/S4lExG8EJPJ/9EdcYx+ZdxOSu7CGOcn6QCccdq8Q0B7+CIPoueJ3tY2pHAq
 nXFbICFYFNA6DDoVkgHWbGMPcd+N1ENzOGcLi3O8c2rOrJ8oFZip6Y7x/HRE/8dtHPd8 Qw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=V1lQDaOMYztoSOPdP3Q6ZBGYsBEjTef5rLi89EbMBOQ=;
 b=IKTr1JZpfrjvj+7vDK4ijtcAnPvlpfPSl1q5YMAukZGeKpHXvNOWg/mq6KMAJK9H/Aes
 MbJrqU59jD00MJ6etWQmyyHJmVP7uwxXMSYtk0lz6y4AIVrVCWuj4a/RuD9C8+OP/4ft
 fUr31VIDPMtvr86y5yGhRd9LDSl7gCcPEyU/K85QsXmc2x6Ya98aMHcJNjP9BtSxKSqF
 chM8HBrJfZyagZInmPdWw0mZfSJha3r/uhDkdA7z3k51fbnAUv0QChEnB69wK0wlOR9V
 EvQ+yukU4M7rZbetjRzNKWh5wyfYom4XViAAWXo2y8mlJSdeNHUPVjgIlGfagNifQB18 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3aaqmusset-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 09 Aug 2021 16:31:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 179GUa1I066307;
        Mon, 9 Aug 2021 16:31:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        by aserp3020.oracle.com with ESMTP id 3a9vv385x7-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 09 Aug 2021 16:31:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geY0GDQwh+70x6A/XU4+FXh/EYtbRl/RRl4SCxxsOkPXtcesQFmEXa6IzuhjToV0KG8Y7btzFd7vokRLgb7pC5pcSXupUYKwJZY87+6ULvafg4z037+EKlW7yC0dCASQjRBdibfRkb8VFWHsAgTzIaVgiZKLH0onL26AH4KVn+22lWbjIcW9JaiV6n8pGlB0GMgj1pICT7R3STmqTxMq3/NILishyIFqAYAcYXQ2kM7aX42wFJWXNsDQVYLBkazpgH67VXdDU2vICx5sTJUkuB3kPNpyiUhuMf55NEAU79CfLhbQdYFuCT+32MBipz/ylUSs2qSgEZ20z2eErowUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1lQDaOMYztoSOPdP3Q6ZBGYsBEjTef5rLi89EbMBOQ=;
 b=aJZsR4cMty6EDXZWbclIJLzoLitNia8ko3J/m70Xnj87cyE0gmSUP54YCWERkONWklRL35nZDnM0kE0QLys3cOZk1O8fD8DEYw38n1Xo4g48+xcBZa9bIqup1Dpw8P/tuFC64azrF4vgD7nipcyEPhAqW6YSDolkGDdlPhsfj99XjVXZ8cVwLLdRAL5ZkldvPpWF/die2zBNB0WcT0iyUkG2p5yMYYxP53bp7NWWfJuFDDuQ+wDYgWYY8bh2xjj8Mu5fNkuenVqfnZ4TdAsR2GZqE7/pbT/iN16o6INz866zfTCrFwKx6ccULYuSjoXi4xd8awHEjTmBx8e346mKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1lQDaOMYztoSOPdP3Q6ZBGYsBEjTef5rLi89EbMBOQ=;
 b=Ig7cEiA/vNEOjym5LnjjPPBrcJ4cr9bZGFh3467o6sS3KWR1Jd/wY1DKhBfP7MuMIxLr6vYxoRZGx+13u3HoV8DN/xflsxJBzvnxz6D4Q+u+ids8cs0RtQIb6Gf97/ath8zzDhaLlltqBWXiN1i2qG5guJJmxHzLiC12C2seH/Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 by BYAPR10MB2631.namprd10.prod.outlook.com (2603:10b6:a02:ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Mon, 9 Aug
 2021 16:30:46 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::e035:720f:86fd:bae3]) by BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::e035:720f:86fd:bae3%4]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 16:30:46 +0000
From:   Ross Philipson <ross.philipson@oracle.com>
To:     linux-kernel@vger.kernel.org, x86@kernel.org,
        iommu@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     ross.philipson@oracle.com, dpsmith@apertussolutions.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        luto@amacapital.net, kanth.ghatraju@oracle.com,
        trenchboot-devel@googlegroups.com
Subject: [PATCH v3 04/14] Documentation/x86: Secure Launch kernel documentation
Date:   Mon,  9 Aug 2021 12:38:46 -0400
Message-Id: <1628527136-2478-5-git-send-email-ross.philipson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628527136-2478-1-git-send-email-ross.philipson@oracle.com>
References: <1628527136-2478-1-git-send-email-ross.philipson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:806:a7::26) To BY5PR10MB3793.namprd10.prod.outlook.com
 (2603:10b6:a03:1f6::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lateralus.us.oracle.com (209.17.40.43) by SA9PR10CA0021.namprd10.prod.outlook.com (2603:10b6:806:a7::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 16:30:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af1dfb11-8e97-4ebd-4432-08d95b530a56
X-MS-TrafficTypeDiagnostic: BYAPR10MB2631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB263174F688CDF6C4A42ADD26E6F69@BYAPR10MB2631.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wzrsWGFpumF2NP8/0thZlTZdd061SEEHyknffiENE3Vz3R4JQW61TUTF+9I6OQvMwskuzRVJ9F4M+8SFTD39anrI+MnSoNQQpuc96xd35q/vfiB8GUKPmQoJ6zX3ePQX0UkqjteAeato8cTpm6Ma/7LZJF4mjH0Lb+gbJhnqNSbxSD6m9effTgUhkkAdpx9VYmmaLWCFxpeX/HXYa+Y4xpJ/eDPS+8UlJXSKIH8WbOf6TwJRRuse89WQbv5Y/s9ZL5hcx5X0UkAPk4BmjaUz4uxXE6fvYXx9wSTchq8WLYv5Ki/yLhJIo6ouGhWURaj5GetcKvdcEZXlkgwegAWrocYj1PHA87GC5/Z1x/3n4aVPkVbKu61MW/3AmxElNPQRO5tuzKa7YizAR0eoyaOU9slTk+GRzihWg/LIFXwYtXIXmaik+2adIpwpffDt9D3B411WS3mqrGxFl7/k3OOZpi38ipXFxBqWDVm6zgYumjbyvCTHIg7cHCJrTMsQWrXTnFzRfZA4CoTR5sK0s6N4/uqtr1t4hZLzvlOgDsARzagK32cJ4Eo2qhJ5idfHZsEGmPeDoc3F8m8s3wfltum0QT6IM7KLm0PzagBj6oBD4kAvSlkjz+VDNccXL+Vz/lfp58rS4DZCSF98GHcVfdpjVvyKVZ7mWpHY3/zFCob+a7veKk9PAUjmaBwlSB3dUPa5gjIlBVUOJCX2lTwWA7c4CdqO77oEK2pznzwA4MpTtYT+vQyNNhpyB0xzyukvcRIS/xswLcoDRx4Q+iobJx/OanTr/n2FE9sXfZ4MNRlHLE1vBtZlvlpH+NAfLHLAy/C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3793.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(376002)(346002)(366004)(4326008)(7416002)(6486002)(36756003)(8936002)(478600001)(26005)(2906002)(7696005)(52116002)(8676002)(186003)(38350700002)(38100700002)(66556008)(83380400001)(66946007)(5660300002)(956004)(66476007)(2616005)(30864003)(86362001)(44832011)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sabDXc5YXlNugBPFXLd5FbeSShmStdjTkQLoO/5A/6h7oM6hBbKmtJIdtV+i?=
 =?us-ascii?Q?XiY09FK9SLik107URBv05SCsW92QY16KTsudtt8j+OC/geN17a1YDg6h+x0j?=
 =?us-ascii?Q?AuQs5g0VuwDGZkJ3FjIIUpU/n93IUoBpeF67MxF8sQpfdEOipiIlKW023H56?=
 =?us-ascii?Q?eAM53Xy03cyocrQ2NOZgruv1iQdclxoSaorHb6isDlWk6TpNtYAl4n+TTevN?=
 =?us-ascii?Q?RAB/l3icP+fZy7QBDYz2eVuJJvCJwbunwywb3vZEUAGMVsFj/c0O3zAF2/sW?=
 =?us-ascii?Q?4yh0uMgjmDp5WPIJch9np7ssy0EidI3ithRhIYXU+QK0N40luFfdZJSlC1kM?=
 =?us-ascii?Q?dq1EFFApjx4LLQYTojtaLVXdw+lMVufEorbsrCNEU96W9l3OY1t3oA2Jz+mZ?=
 =?us-ascii?Q?YGInrAW8fDc2zeczzc6jyfmrJmzudfFbK9XKNaA8Rec2p3Loj1vASzT9TfzG?=
 =?us-ascii?Q?Wi3hTpPtbp82SRA2EnNC6aY7zzNQ/xhCv0A++wk3gG+KZ2B2wqRGeVU76pFe?=
 =?us-ascii?Q?h0fI9GP2l9TdFPBRu3V1MQmczm20gJ4/BOEA96lwWWPZmLxoQUhBVsRTJVcN?=
 =?us-ascii?Q?rn1AccSt+pTZzRF4BaGW+/c1HWCHv3z2OfdKsx0I/VGOeJfwh9iETtx2PRgF?=
 =?us-ascii?Q?4ilz2VgZMTsxwqGfUUVMeE2gV7CXKR32OqlhM3t2JhxNHHw7IFa+of/vsieU?=
 =?us-ascii?Q?cFJcYbLErwYU7cW9aZLBFQla9Y4f7DNF+SevCJs2gQbO/CWdA4EwY8UpNgrx?=
 =?us-ascii?Q?h1xP39sdEG4LViTb/Ms0eAEInHng6/mUyhHXlQwc1eAVIG6YkAOXfdpUoXDE?=
 =?us-ascii?Q?6UMO26BqohiqZtt/tYJLwdVmo9mzWaA4JYLQhMKY1e06fkmhMM6bkZuHIRCp?=
 =?us-ascii?Q?GdxGdYLGNfYapa7ke5PflVno3uUJLnfKeXQHwk6Vb+fDYCRMSG9v2HmjdsAM?=
 =?us-ascii?Q?nafOHtOfU5yk9MeiRjoBcemONsA+hDoMKQuh0osCS2RZnMjSOssUQ9zxyaAp?=
 =?us-ascii?Q?e+YY419+1RqM1DvfYUHCG5AZcDC8sDcT+0e1hvfcqdi4JAyGYo+sOJ4uDdyM?=
 =?us-ascii?Q?e7WvQ/D/6Miy+QNXH41d/ZoCCbzt393yk42IuxGmc+eS2Ork7uh4yjeztMQO?=
 =?us-ascii?Q?p8nGn4F3MP0oLPLuSzRq9SpAgMfV6vOUnEc69UVKvHP2Pf9+ksIOfLspNny8?=
 =?us-ascii?Q?2DVaCH2llUqP102QqyVpwCgC53Yc5bBG+gRfGJ4fe3Syk9bUsxC3KdMPbGWQ?=
 =?us-ascii?Q?WVdYdneJTRCX9hxDDAAC0+lgslz6NOqRvAfqW/YJ+K8tj0ivYkD0a1ArPDv9?=
 =?us-ascii?Q?QftkoGtp9o0O1xnI6OfuhH3o?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1dfb11-8e97-4ebd-4432-08d95b530a56
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 16:30:46.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqvJMHtMEM/f6TT/rZLsvSnmrHyb7ZLpUWESOi5fI28RopV9SpUcP8Z9ME+SdOMsLQ9mjxsL+6lRQWYg/VO4f1hpGITNSW6DlwNAYk4j9AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2631
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090119
X-Proofpoint-GUID: Ap1v-4H7Ua0DoN2_86GowISLljyh8IQN
X-Proofpoint-ORIG-GUID: Ap1v-4H7Ua0DoN2_86GowISLljyh8IQN
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introduce background, overview and configuration/ABI information
for the Secure Launch kernel feature.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
---
 Documentation/x86/index.rst         |   1 +
 Documentation/x86/secure-launch.rst | 714 ++++++++++++++++++++++++++++++++++++
 2 files changed, 715 insertions(+)
 create mode 100644 Documentation/x86/secure-launch.rst

diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index 3830483..e5a058f 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -31,6 +31,7 @@ x86-specific Documentation
    tsx_async_abort
    buslock
    usb-legacy-support
+   secure-launch
    i386/index
    x86_64/index
    sva
diff --git a/Documentation/x86/secure-launch.rst b/Documentation/x86/secure-launch.rst
new file mode 100644
index 0000000..cc5995c6
--- /dev/null
+++ b/Documentation/x86/secure-launch.rst
@@ -0,0 +1,714 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+Secure Launch
+=============
+
+Background
+==========
+
+The Trusted Computing Group (TCG) architecture defines two methods in
+which the target operating system is started, aka launched, on a system
+for which Intel and AMD provides implementations. These two launch types
+are static launch and dynamic launch. Static launch is referred to as
+such because it happens at one fixed point, at system startup, during
+the defined life-cycle of a system. Dynamic launch is referred to as
+such because it is not limited to being done once nor bound to system
+startup. It can in fact happen at anytime without incurring/requiring an
+associated power event for the system. Since dynamic launch can happen
+at anytime, this results in dynamic launch being split into two type of
+its own. The first is referred to as an early launch, where the dynamic
+launch is done in conjunction with the static lunch of the system. The
+second is referred to as a late launch, where a dynamic launch is
+initiated after the static launch was fully completed and the system was
+under the control of some target operating system or run-time kernel.
+These two top-level launch methods, static launch and dynamic launch
+provide different models for establishing the launch integrity, i.e. the
+load-time integrity, of the target operating system. When cryptographic
+hashing is used to create an integrity assessment for the launch
+integrity, then for a static launch this is referred to as the Static
+Root of Trust for Measurement (SRTM) and for dynamic launch it is
+referred to as the Dynamic Root of Trust for Measurement (DRTM).
+
+The reasoning for needing the two integrity models is driven by the fact
+that these models leverage what is referred to as a "transitive trust".
+A transitive trust is commonly referred to as a "trust chain", which is
+created through the process of an entity making an integrity assessment
+of another entity and upon success transfers control to the new entity.
+This process is then repeated by each entity until the Trusted Computing
+Base (TCB) of system has been established. A challenge for transitive
+trust is that the process is susceptible to cumulative error
+and in this case that error is inaccurate or improper integrity
+assessments. The way to address cumulative error is to reduce the
+number of instances that can create error involved in the process.  In
+this case it would be to reduce then number of entities involved in the
+transitive trust. It is not possible to reduce the number of firmware
+components or the boot loader(s) involved during static launch. This is
+where dynamic launch comes in, as it introduces the concept for a CPU to
+provide an instruction that results in a transitive trust starting with
+the CPU doing an integrity assessment of a special loader that can then
+start a target operating system. This reduces the trust chain down to
+the CPU, a special loader, and the target operation system.  It is also
+why it is said that the DRTM is rooted in hardware since the CPU is what
+does the first integrity assessment, i.e. the first measurement, in the
+trust chain.
+
+Overview
+========
+
+Prior to the start of the TrenchBoot project, the only active Open
+Source project supporting dynamic launch was Intel's Tboot project to
+support their implementation of dynamic launch known as Intel Trusted
+eXecution Technology (TXT). The approach taken by Tboot was to provide
+an exokernel that could handle the launch protocol implemented by
+Intel's special loader, the SINIT Authenticated Code Module (ACM [3]_)
+and remained in memory to manage the SMX CPU mode that a dynamic launch
+would put a system. While it is not precluded from being used for doing
+a late launch, Tboot's primary use case was to be used as an early
+launch solution. As a result the TrenchBoot project started the
+development of Secure Launch kernel feature to provide a more
+generalized approach. The focus of the effort is twofold, the first is to
+make the Linux kernel directly aware of the launch protocol used by
+Intel as well as AMD, and the second is to make the Linux kernel be able
+to initiate a dynamic launch. It is through this approach that the
+Secure Launch kernel feature creates a basis for the Linux kernel to be
+used in a variety of dynamic launch use cases.
+
+The first use case that the TrenchBoot project focused on was the
+ability for the Linux kernel to be started by a dynamic launch, in
+particular as part of an early launch sequence. In this case the dynamic
+launch will be initiated by a boot loader with associated support added
+to it, for example the first targeted boot loader in this case was
+GRUB2. An integral part of establishing a measurement-based launch
+integrity involves measuring everything that is intended to be executed
+(kernel image, initrd, etc) and everything that will configure that
+kernel to execute (command line, boot params, etc). Then storing those
+measurements in a protected manner. Both the Intel and AMD dynamic
+launch implementations leverage the Trusted Platform Module (TPM) to
+store those measurements. The TPM itself has been designed such that a
+dynamic launch unlocks a specific set of Platform Configuration
+Registers (PCR) for holding measurement taken during the dynamic launch.
+These are referred to as the DRTM PCRs, PCRs 17-22. Further details on
+this process can be found in the documentation for the GETSEC
+instruction provided by Intel's TXT and the SKINIT instruction provided
+by AMD's AMD-V. The documentation on these technologies can be readily
+found online; see the `Resources`_ section below for references.
+
+Currently only Intel TXT is supported in this first release of the Secure
+Launch feature. AMD/Hygon SKINIT support will be added in a subsequent
+release. Also this first version does not support a late relaunch which
+allows re-establishing the DRTM at various points post boot.
+
+To enable the kernel to be launched by GETSEC, a stub must be built
+into the setup section of the compressed kernel to handle the specific
+state that the dynamic launch process leaves the BSP in. Also this stub
+must measure everything that is going to be used as early as possible.
+This stub code and subsequent code must also deal with the specific
+state that the dynamic launch leaves the APs in.
+
+Basic Boot Flow:
+----------------
+
+Pre-launch: *Phase where the environment is prepared and configured to initiate the
+secure launch in the GRUB bootloader.*
+
+ - Prepare the CPU and the TPM for the launch.
+ - Load the kernel, initrd and ACM [3]_ into memory.
+ - Setup the TXT heap and page tables describing the MLE [1]_ per the
+   specification.
+ - Initiate the secure launch with the GETSET[SENTER] instruction.
+
+Post-launch: *Phase where control is passed from the ACM to the MLE and the secure
+kernel begins execution.*
+
+ - Entry from the dynamic launch jumps to the SL stub
+ - SL stub fixes up the world on the BSP
+ - For TXT, SL stub wakes the APs, fixes up their worlds
+ - For TXT, APs are left halted waiting for an NMI to wake them
+ - SL stub jumps to startup_32
+ - SL main locates the TPM event log and writes the measurements of
+   configuration and module information into it.
+ - Kernel boot proceeds normally from this point.
+ - During early setup, slaunch_setup() runs to finish some validation
+   and setup tasks.
+ - The SMP bringup code is modified to wake the waiting APs. APs vector
+   to rmpiggy and start up normally from that point.
+ - SL platform module is registered as a late initcall module. It reads
+   the TPM event log and extends the measurements taken into the TPM PCRs.
+ - SL platform module initializes the securityfs interface to allow
+   asccess to the TPM event log and TXT public registers.
+ - Kernel boot finishes booting normally
+ - SEXIT support to leave SMX mode is present on the kexec path and
+   the various reboot paths (poweroff, reset, halt).
+
+
+.. note::
+    A quick note on terminology. The larger open source project itself is
+    called TrenchBoot, which is hosted on GitHub (links below). The kernel
+    feature enabling the use of the x86 technology is referred to as "Secure
+    Launch" within the kernel code.
+
+Configuration
+=============
+
+The settings to enable Secure Launch using Kconfig are under::
+
+  "Processor type and features" --> "Secure Launch support"
+
+A kernel with this option enabled can still be booted using other supported
+methods. There are two Kconfig options for Secure Launch::
+
+  "Secure Launch Alternate PCR 19 usage"
+  "Secure Launch Alternate PCR 20 usage"
+
+The help indicates their usage as alternate post launch PCRs to separate
+measurements for more flexibility (both disabled by default).
+
+To reduce the Trusted Computing Base (TCB) of the MLE [1]_, the build
+configuration should be pared down as narrowly as one's use case allows.
+The fewer drivers (less active hardware) and features reduces the attack
+surface. E.g. in the extreme, the MLE could only have local disk access
+and no other hardware support. Or only network access for remote attestation.
+
+It is also desirable if possible to embed the initrd used with the MLE kernel
+image to reduce complexity.
+
+The following are a few important configuration necessities to always consider:
+
+KASLR Configuration
+-------------------
+
+Secure Launch does not interoperate with KASLR. If possible, the MLE should be
+built with KASLR disabled::
+
+  "Processor type and features" -->
+      "Build a relocatable kernel" -->
+          "Randomize the address of the kernel image (KASLR) [ ]"
+
+This unsets the Kconfig value CONFIG_RANDOMIZE_BASE.
+
+If not possible, KASLR must be disabled on the kernel command line when doing
+a Secure Launch as follows::
+
+  nokaslr
+
+IOMMU Configuration
+-------------------
+
+When doing a Secure Launch, the IOMMU should always be enabled and the drivers
+loaded. However, IOMMU passthrough mode should never be used. This leaves the
+MLE completely exposed to DMA after the PMR's [2]_ are disabled. First, IOMMU
+passthrough should be disabled by default in the build configuration::
+
+  "Device Drivers" -->
+      "IOMMU Hardware Support" -->
+          "IOMMU passthrough by default [ ]"
+
+This unset the Kconfig value CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
+
+In addition, passthrough must be disabled on the kernel command line when doing
+a Secure Launch as follows::
+
+  iommu=nopt iommu.passthrough=0
+
+Interface
+=========
+
+The primary interfaces between the various components in TXT are the TXT MMIO
+registers and the TXT heap. The MMIO register banks are described in Appendix B
+of the TXT MLE [1]_ Developement Guide.
+
+The TXT heap is described in Appendix C of the TXT MLE [1]_ Development
+Guide. Most of the TXT heap is predefined in the specification. The heap is
+initialized by firmware and the pre-launch environment and is subsequently used
+by the SINIT ACM. One section, called the OS to MLE Data Table, is reserved for
+software to define. This table is the Secure Launch binary interface between
+the pre- and post-launch environments and is defined as follows::
+
+        /*
+         * Secure Launch defined MTRR saving structures
+         */
+        struct txt_mtrr_pair {
+                u64 mtrr_physbase;
+                u64 mtrr_physmask;
+        } __packed;
+
+        struct txt_mtrr_state {
+                u64 default_mem_type;
+                u64 mtrr_vcnt;
+                struct txt_mtrr_pair mtrr_pair[TXT_OS_MLE_MAX_VARIABLE_MTRRS];
+        } __packed;
+
+        /*
+         * Secure Launch defined OS/MLE TXT Heap table
+         */
+        struct txt_os_mle_data {
+                u32 version;
+                u32 boot_params_addr;
+                u64 saved_misc_enable_msr;
+                struct txt_mtrr_state saved_bsp_mtrrs;
+                u32 ap_wake_block;
+                u32 ap_wake_block_size;
+                u64 evtlog_addr;
+                u32 evtlog_size;
+                u8 mle_scratch[64];
+        } __packed;
+
+Description of structure:
+
+=====================  ========================================================================
+Field                  Use
+=====================  ========================================================================
+version                Structure version, current value 1
+boot_params_addr       Physical address of the zero page/kernel boot params
+saved_misc_enable_msr  Original Misc Enable MSR (0x1a0) value stored by the pre-launch
+                       environment. This value needs to be restored post launch - this is a
+                       requirement.
+saved_bsp_mtrrs        Original Fixed and Variable MTRR values stored by the pre-launch
+                       environment. These values need to be restored post launch - this is a
+                       requirement.
+ap_wake_block          Pre-launch allocated memory block to wake up and park the APs post
+                       launch until SMP support is ready. This block is validated by the MLE
+                       before use.
+ap_wake_block_size     Size of the ap_wake_block. A minimum of 16384b (4x4K pages) is required.
+evtlog_addr            Pre-launch allocated memory block for the TPM event log. The event
+                       log is formatted both by the pre-launch environment and the SINIT
+                       ACM. his block is validated by the MLE before use.
+evtlog_size            Size of the evtlog_addr block.
+mle_scratch            Scratch area used post-launch by the MLE kernel. Fields:
+ 
+                        - SL_SCRATCH_AP_EBX area to share %ebx base pointer among CPUs
+                        - SL_SCRATCH_AP_JMP_OFFSET offset to abs. ljmp fixup location for APs
+=====================  ========================================================================
+
+Resources
+=========
+
+The TrenchBoot project including documentation:
+
+https://github.com/trenchboot
+
+TXT documentation in the Intel TXT MLE Development Guide:
+
+https://www.intel.com/content/dam/www/public/us/en/documents/guides/intel-txt-software-development-guide.pdf
+
+TXT instructions documentation in the Intel SDM Instruction Set volume:
+
+https://software.intel.com/en-us/articles/intel-sdm
+
+AMD SKINIT documentation in the System Programming manual:
+
+https://www.amd.com/system/files/TechDocs/24593.pdf
+
+GRUB pre-launch support patchset (WIP):
+
+https://lists.gnu.org/archive/html/grub-devel/2020-05/msg00011.html
+
+Error Codes
+===========
+
+The TXT specification defines the layout for TXT 32 bit error code values.
+The bit encodings indicate where the error originated (e.g. with the CPU,
+in the SINIT ACM, in software). The error is written to a sticky TXT
+register that persists across resets called TXT.ERRORCODE (see the TXT
+MLE Development Guide). The errors defined by the Secure Launch feature are
+those generated in the MLE software. They have the format::
+
+  0xc0008XXX
+
+The low 12 bits are free for defining the following Secure Launch specific
+error codes.
+
+======  ================
+Name:   SL_ERROR_GENERIC
+Value:  0xc0008001
+======  ================
+
+Description:
+
+Generic catch all error. Currently unused.
+
+======  =================
+Name:   SL_ERROR_TPM_INIT
+Value:  0xc0008002
+======  =================
+
+Description:
+
+The secure launch code failed to get an access to the TPM hardware interface.
+This is most likely to due to misconfigured hardware or kernel. Ensure the
+TPM chip is enabled and the kernel TPM support is built in (it should not be
+built as a module).
+
+======  ==========================
+Name:   SL_ERROR_TPM_INVALID_LOG20
+Value:  0xc0008003
+======  ==========================
+
+Description:
+
+The secure launch code failed to find a valid event log descriptor for TPM
+version 2.0 or the event log descriptor is malformed. Usually this indicates
+that incompatible versions of the pre-launch environment (GRUB) and the MLE
+kernel. GRUB and the kernel share a structure in the TXT heap and if this
+structure (the OS-MLE table) is mismatched, this error is often seen. In
+addition, this value is set by the pre-launch environment, so the issue could
+originate there. It could be the sign of an attempted attack.
+
+======  ===========================
+Name:   SL_ERROR_TPM_LOGGING_FAILED
+Value:  0xc0008004
+======  ===========================
+
+Description:
+
+There was a failed attempt to write a TPM event to the event log early in the
+secure launch process. This is likely the result of a malformed TPM event log
+buffer. Formatting of the event log buffer information is done by the
+pre-launch environment (GRUB) so the the issue originates there.
+
+======  ============================
+Name:   SL_ERROR_REGION_STRADDLE_4GB
+Value:  0xc0008005
+======  ============================
+
+Description:
+
+During early validation a buffer or region was found to straddle the 4Gb
+boundary. Because of the way TXT does DMA memory protection, this is an
+unsafe configuration and is flagged as an error. This is most likely a
+configuration issue in the pre-launch environment. It could also be the sign of
+an attempted attack.
+
+======  ===================
+Name:   SL_ERROR_TPM_EXTEND
+Value:  0xc0008006
+======  ===================
+
+Description:
+
+There was a failed attempt to extend a TPM PCR in the secure launch platform
+module. This is most likely to due to misconfigured hardware or kernel. Ensure
+the TPM chip is enabled and the kernel TPM support is built in (it should not
+be built as a module).
+
+======  ======================
+Name:   SL_ERROR_MTRR_INV_VCNT
+Value:  0xc0008007
+======  ======================
+
+Description:
+
+During early secure launch validation an invalid variable MTRR count was found.
+The pre-launch environment passes a number of MSR values to the MLE to restore
+including the MTRRs. The values are restored by the secure launch early entry
+point code. After measuring the values supplied by the pre-launch environment,
+a discrepancy was found validating the values. It could be the sign of an
+attempted attack.
+
+======  ==========================
+Name:   SL_ERROR_MTRR_INV_DEF_TYPE
+Value:  0xc0008008
+======  ==========================
+
+Description:
+
+During early secure launch validation an invalid default MTRR type was found.
+See SL_ERROR_MTRR_INV_VCNT for more details.
+
+======  ======================
+Name:   SL_ERROR_MTRR_INV_BASE
+Value:  0xc0008009
+======  ======================
+
+Description:
+
+During early secure launch validation an invalid variable MTRR base value was
+found. See SL_ERROR_MTRR_INV_VCNT for more details.
+
+======  ======================
+Name:   SL_ERROR_MTRR_INV_MASK
+Value:  0xc000800a
+======  ======================
+
+Description:
+
+During early secure launch validation an invalid variable MTRR mask value was
+found. See SL_ERROR_MTRR_INV_VCNT for more details.
+
+======  ========================
+Name:   SL_ERROR_MSR_INV_MISC_EN
+Value:  0xc000800b
+======  ========================
+
+Description:
+
+During early secure launch validation an invalid miscellaneous enable MSR value
+was found. See SL_ERROR_MTRR_INV_VCNT for more details.
+
+======  =========================
+Name:   SL_ERROR_INV_AP_INTERRUPT
+Value:  0xc000800c
+======  =========================
+
+Description:
+
+The application processors (APs) wait to be woken up by the SMP initialization
+code. The only interrupt that they expect is an NMI; all other interrupts
+should be masked. If an AP gets some other interrupt other than an NMI it will
+cause this error. This error is very unlikely to occur.
+
+======  =========================
+Name:   SL_ERROR_INTEGER_OVERFLOW
+Value:  0xc000800d
+======  =========================
+
+Description:
+
+A buffer base and size passed to the MLE caused an integer overflow when
+added together. This is most likely a configuration issue in the pre-launch
+environment. It could also be the sign of an attempted attack.
+
+======  ==================
+Name:   SL_ERROR_HEAP_WALK
+Value:  0xc000800e
+======  ==================
+
+Description:
+
+An error occurred in TXT heap walking code. The underlying issue is a failure to
+early_memremap() portions of the heap, most likely due to a resource shortage.
+
+======  =================
+Name:   SL_ERROR_HEAP_MAP
+Value:  0xc000800f
+======  =================
+
+Description:
+
+This error is essentially the same as SL_ERROR_HEAP_WALK but occured during the
+actual early_memremap() operation.
+
+======  =========================
+Name:   SL_ERROR_REGION_ABOVE_4GB
+Value:  0xc0008010
+======  =========================
+
+Description:
+
+A memory region used by the MLE is above 4GB. In general this is not a problem
+because memory > 4Gb can be protected from DMA. There are certain buffers that
+should never be above 4Gb though and one of these caused the violation. This is
+most likely a configuration issue in the pre-launch environment. It could also
+be the sign of an attempted attack.
+
+======  ==========================
+Name:   SL_ERROR_HEAP_INVALID_DMAR
+Value:  0xc0008011
+======  ==========================
+
+Description:
+
+The backup copy of the ACPI DMAR table which is supposed to be located in the
+TXT heap could not be found. This is due to a bug in the platform's ACM module
+or in firmware.
+
+======  =======================
+Name:   SL_ERROR_HEAP_DMAR_SIZE
+Value:  0xc0008012
+======  =======================
+
+Description:
+
+The backup copy of the ACPI DMAR table in the TXT heap is to large to be stored
+for later usage. This error is very unlikely to occur since the area reserved
+for the copy is far larger than the DMAR should be.
+
+======  ======================
+Name:   SL_ERROR_HEAP_DMAR_MAP
+Value:  0xc0008013
+======  ======================
+
+Description:
+
+The backup copy of the ACPI DMAR table in the TXT heap could not be mapped. The
+underlying issue is a failure to early_memremap() the DMAR table, most likely
+due to a resource shortage.
+
+======  ====================
+Name:   SL_ERROR_HI_PMR_BASE
+Value:  0xc0008014
+======  ====================
+
+Description:
+
+On a system with more than 4G of RAM, the high PMR [2]_ base address should be set
+to 4G. This error is due to that not being the case. This PMR value is set by
+the pre-launch environment so the issue originates there. It could also be the
+sign of an attempted attack.
+
+======  ====================
+Name:   SL_ERROR_HI_PMR_SIZE
+Value:  0xc0008015
+======  ====================
+
+Description:
+
+On a system with more than 4G of RAM, the high PMR [2]_ size should be set to cover
+all RAM > 4G. This error is due to that not being the case. This PMR value is
+set by the pre-launch environment so the issue originates there. It could also
+be the sign of an attempted attack.
+
+======  ====================
+Name:   SL_ERROR_LO_PMR_BASE
+Value:  0xc0008016
+======  ====================
+
+Description:
+
+The low PMR [2]_ base should always be set to address zero. This error is due to
+that not being the case. This PMR value is set by the pre-launch environment
+so the issue originates there. It could also be the sign of an attempted
+attack.
+
+======  ====================
+Name:   SL_ERROR_LO_PMR_MLE
+Value:  0xc0008017
+======  ====================
+
+Description:
+
+This error indicates the MLE image is not covered by the low PMR [2]_ range. The
+PMR values are set by the pre-launch environment so the issue originates there.
+It could also be the sign of an attempted attack.
+
+======  =======================
+Name:   SL_ERROR_INITRD_TOO_BIG
+Value:  0xc0008018
+======  =======================
+
+Description:
+
+The external initrd provided is larger than 4Gb. This is not a valid
+configuration for a secure launch due to managing DMA protection.
+
+======  =========================
+Name:   SL_ERROR_HEAP_ZERO_OFFSET
+Value:  0xc0008019
+======  =========================
+
+Description:
+
+During a TXT heap walk an invalid/zero next table offset value was found. This
+indicates the TXT heap is malformed. The TXT heap is initialized by the
+pre-launch environment so the issue most likely originates there. It could also
+be a sign of an attempted attack. In addition, ACM is also responsible for
+manipulating parts of the TXT heap so the issue could be due to a bug in the
+platform's ACM module.
+
+======  =============================
+Name:   SL_ERROR_WAKE_BLOCK_TOO_SMALL
+Value:  0xc000801a
+======  =============================
+
+Description:
+
+The AP wake block buffer passed to the MLE via the OS-MLE TXT heap table is not
+large enough. This value is set by the pre-launch environment so the issue
+originates there. It also could be the sign of an attempted attack.
+
+======  ===========================
+Name:   SL_ERROR_MLE_BUFFER_OVERLAP
+Value:  0xc000801b
+======  ===========================
+
+Description:
+
+One of the buffers passed to the MLE via the OS-MLE TXT heap table overlaps
+with the MLE image in memory. This value is set by the pre-launch environment
+so the issue originates there. It could also be the sign of an attempted
+attack.
+
+======  ==========================
+Name:   SL_ERROR_BUFFER_BEYOND_PMR
+Value:  0xc000801c
+======  ==========================
+
+Description:
+
+One of the buffers passed to the MLE via the OS-MLE TXT heap table is not
+protected by a PMR. This value is set by the pre-launch environment so the
+issue originates there. It could also be the sign of an attempted attack.
+
+======  =============================
+Name:   SL_ERROR_OS_SINIT_BAD_VERSION
+Value:  0xc000801d
+======  =============================
+
+Description:
+
+The version of the OS-SINIT TXT heap table is bad. It must be 6 or greater.
+This value is set by the pre-launch environment so the issue originates
+there. It could also be the sign of an attempted attack. It is also possible
+though very unlikely that the platform is so old that the ACM being used
+requires an unsupported version.
+
+======  =====================
+Name:   SL_ERROR_EVENTLOG_MAP
+Value:  0xc000801e
+======  =====================
+
+Description:
+
+An error occurred in the secure launch module while mapping the TPM event log.
+The underlying issue is memremap() failure, most likely due to a resource
+shortage.
+
+======  ========================
+Name:   SL_ERROR_TPM_NUMBER_ALGS
+Value:  0xc000801f
+======  ========================
+
+Description:
+
+The TPM 2.0 event log reports an unsupported number of hashing algorithms.
+Secure launch currently only supports a maximum of two: SHA1 and SHA256.
+
+======  ===========================
+Name:   SL_ERROR_TPM_UNKNOWN_DIGEST
+Value:  0xc0008020
+======  ===========================
+
+Description:
+
+The TPM 2.0 event log reports an unsupported hashing algorithm. Secure launch
+currently only supports two algorithms: SHA1 and SHA256.
+
+======  ==========================
+Name:   SL_ERROR_TPM_INVALID_EVENT
+Value:  0xc0008021
+======  ==========================
+
+Description:
+
+An invalid/malformed event was found in the TPM event log while reading it.
+Since only trusted entities are supposed to be writing the event log, this
+would indicate either a bug or a possible attack.
+
+.. [1]
+    MLE: Measured Launch Environment is the binary runtime that is measured and
+    then run by the TXT SINIT ACM. The TXT MLE Development Guide describes the
+    requirements for the MLE in detail.
+
+.. [2]
+    PMR: Intel VTd has a feature in the IOMMU called Protected Memory Registers.
+    There are two of these registers and they allow all DMA to be blocked
+    to large areas of memory. The low PMR can cover all memory below 4Gb on 2Mb
+    boundaries. The high PMR can cover all RAM on the system, again on 2Mb
+    boundaries. This feature is used during a secure launch by TXT.
+
+.. [3]
+    ACM: Intel's Authenticated Code Module. This is the 32b bit binary blob that
+    is run securely by the GETSEC[SENTER] during a measured launch. It is described
+    in the Intel documentation on TXT and versions for various chipsets are
+    signed and distributed by Intel.
-- 
1.8.3.1

