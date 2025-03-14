Return-Path: <linux-doc+bounces-40868-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80BA6175A
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 18:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B4E8800B5
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 17:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6290E2046B7;
	Fri, 14 Mar 2025 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="yGZSvF4L"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD23220370B;
	Fri, 14 Mar 2025 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741972778; cv=none; b=hFk1XwnmKYUSmQraGkQWzaUESri3YMlLMsuaHsUAElMHth1jGzh/lx2Ip9lZkwdR0wKCzPRC1DThetONqNmw3VqdRFoWzxTtOvN+6Vr3G/7bsgoe2/sMenJ1kjPHJG8DhlDnxZo/PaQnZH/E9lwFEAqiDrNNsMHCtdsGP24gd6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741972778; c=relaxed/simple;
	bh=H355dxdG0Xsn4lZoOnn81EO/WIXIxpVgYqHnPiaIH+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hcU5kCETsh6CmfvtCNtBpiD0yR5xERhJtRBzHDqeJl/0uRhNiecFffVoVgHGTaLIpgD37KCotA8e/I0OuDrgzO5pthR26QTgSQxyBOzCcPLdZODs6U2Gf8ga8T6fKf1pxaObVFHKbbhGKsFXV4lNODhVbR7tzU3N9xScNj6W/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=yGZSvF4L; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EFw10t016610;
	Fri, 14 Mar 2025 13:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=nr3gM
	JBeM30PXhkwotn96DJDbh2wJpdNOHdPtkfpqF8=; b=yGZSvF4LdNziIY57HdEKn
	io5SPlzGRQTy6AHTUQ7cY2D13Fo+hB4yEM6UeudF3H1AowV7mGK6IpFluSiOXwjW
	BrsOIOM67hE2nMS5mTR1qFHnCO0BdH6e5tLWgLqLuGVaCKfoujZAIJe+WF4JDYJT
	ZNpDRWht2lFjDCe+ETTNmJcfpnhT9tpTb4eVqlQRtXaf2x0u2PnzXdOpwejtnbPa
	JjKxh3W2guGE0AvvUwGKjc6P91gijeW4pw3enfNtrILIZGNEM5DMCiCsULy/XLIb
	5Y/RTnOF4+cZtKaiwpnOOS+872+Ybh+3KRQh4rabmnKhthOY/pqPcQqYpBTiVwjZ
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45cqjg8a9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 13:19:21 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 52EHJGsA018796
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 13:19:16 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 14 Mar 2025 13:19:16 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 14 Mar 2025 13:19:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 14 Mar 2025 13:19:16 -0400
Received: from work.ad.analog.com (HYB-hERzalRezfV.ad.analog.com [10.65.205.9])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 52EHJ0Nx005016;
	Fri, 14 Mar 2025 13:19:02 -0400
From: Marcelo Schmitt <marcelo.schmitt@analog.com>
To: <linux-iio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <jic23@kernel.org>, <lars@metafoo.de>, <Michael.Hennerich@analog.com>,
        <corbet@lwn.net>, <marcelo.schmitt1@gmail.com>
Subject: [PATCH v1 2/4] Documentation: iio: ad4000: Add new supported parts
Date: Fri, 14 Mar 2025 14:18:57 -0300
Message-ID: <2f8907e794ecaf9c599abc6cee8175ca184a79cc.1741970538.git.marcelo.schmitt@analog.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1741970538.git.marcelo.schmitt@analog.com>
References: <cover.1741970538.git.marcelo.schmitt@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: zyzkJwe64kcrOM0H0Jqrg2lf-d7_REZt
X-Proofpoint-ORIG-GUID: zyzkJwe64kcrOM0H0Jqrg2lf-d7_REZt
X-Authority-Analysis: v=2.4 cv=EL0G00ZC c=1 sm=1 tr=0 ts=67d46519 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=Vs1iUdzkB0EA:10 a=gAnH3GRIAAAA:8 a=Mo7kHg2TyUSTJzBVpLsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxlogscore=993
 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140136

Commit <c3948d090080> ("iio: adc: ad4000: Add support for PulSAR devices"),
extended the ad4000 driver supports many single-channel PulSAR devices.

Update IIO ad4000 documentation with the extra list of supported devices.

Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
---
 Documentation/iio/ad4000.rst | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/iio/ad4000.rst b/Documentation/iio/ad4000.rst
index de8fd3ae6e62..5578a9cfd9d5 100644
--- a/Documentation/iio/ad4000.rst
+++ b/Documentation/iio/ad4000.rst
@@ -4,7 +4,7 @@
 AD4000 driver
 =============
 
-Device driver for Analog Devices Inc. AD4000 series of ADCs.
+Device driver for Analog Devices Inc. AD4000 series of ADCs and similar devices.
 
 Supported devices
 =================
@@ -25,6 +25,21 @@ Supported devices
 * `AD4022 <https://www.analog.com/AD4022>`_
 * `ADAQ4001 <https://www.analog.com/ADAQ4001>`_
 * `ADAQ4003 <https://www.analog.com/ADAQ4003>`_
+* `AD7685 <https://www.analog.com/AD7685>`_
+* `AD7686 <https://www.analog.com/AD7686>`_
+* `AD7687 <https://www.analog.com/AD7687>`_
+* `AD7688 <https://www.analog.com/AD7688>`_
+* `AD7690 <https://www.analog.com/AD7690>`_
+* `AD7691 <https://www.analog.com/AD7691>`_
+* `AD7693 <https://www.analog.com/AD7693>`_
+* `AD7942 <https://www.analog.com/AD7942>`_
+* `AD7946 <https://www.analog.com/AD7946>`_
+* `AD7980 <https://www.analog.com/AD7980>`_
+* `AD7982 <https://www.analog.com/AD7982>`_
+* `AD7983 <https://www.analog.com/AD7983>`_
+* `AD7984 <https://www.analog.com/AD7984>`_
+* `AD7988-1 <https://www.analog.com/AD7988-1>`_
+* `AD7988-5 <https://www.analog.com/AD7988-5>`_
 
 Wiring connections
 ------------------
-- 
2.47.2


