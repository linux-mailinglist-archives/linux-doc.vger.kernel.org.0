Return-Path: <linux-doc+bounces-2830-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2527F3C54
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 04:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00321B21991
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 03:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923905252;
	Wed, 22 Nov 2023 03:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="E2JSAiBl"
X-Original-To: linux-doc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2059.outbound.protection.outlook.com [40.107.215.59])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E2ED40;
	Tue, 21 Nov 2023 19:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRQKHRRAvk0wkEpRF/ovFEvYLa11KgznKfQpVwDVHVu3cknrnedu3q7YoLzkNw420WR8HbbqkQWPBI9Sy8YN8aO4s+WDQm+qIHQ8SrNV1imz9e9Y9a8vnJMydE/i9XAcmNkoBT9P2l9+U9JstqnDMfpqn4ggc69T66/nMYMK2IaLjwQq5+9b7Fsuljiei8LtWNSt6Gb0f0x6KQ7N97oigzXdW4Eq9ulO3PIO88WzEbFeYc90QnCdd7EqLiO7LIEPjGqf9NxzojObm9Su+M0j9P41UNtNI0Lp4xkALsOu7FyRQ4O6Aow54dESs+JuHbY3QD6N+vFkxGdEL1+qDY9wcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne8DHLwPA/jsT43c17x9qaPVf2vrRJXucJfidDLh7SY=;
 b=G9V9RYj9KSgsT7VUC7uMuowpLYgzoOZsFsbuXloYnFRIUbQbRgOFWBbNlbkFRt9t1DL/pkhQNn4gOyI9We2FaCzZPB2bAceQCBJHuzyDhpqnXWyaUiCR/izdlaclYbKJVq4m8/dKjz3dO3+Wxfa3quC16o6eeOf/+tBk33GPrRKg+h/YaFYX3yjrOQOWpvrltWjO1nNvAXTJwUi7opIQDGUB0oQvZS/jjL106XeGxaOOmW3/xXbpu3Qy+VfGATvdvcAWJk2I1EozcPz1dAtXvawsm4YhaVbsdNylxmQZtEhhj/KB2D5k6ToWybLCAN4WIiZoXXYLYu3J/qEYj7kHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne8DHLwPA/jsT43c17x9qaPVf2vrRJXucJfidDLh7SY=;
 b=E2JSAiBlBvFVwy6lixUvmU1Qyqa5oJQJr/F+0XqONUyX13Geb0xq7LD+V1UurcxbhbZaPEQR6hIUwHF8hhiUXwNbM6YBpcwxoUiuXvKvz5TjAXydTSfS8Sx3Sj5RyqIyPAWyluh6G0VPLiZWvPThQ9Fh4CWXTozY30FXdEdb3M97xDSSz3sJWiGDVJncR37RrpiXrUA6kUrgo10sv17O+e2oYifCxDxnjVQ/nSpmVcNTxmxsEPmt7kPnJ5PGG0bZoOoGOiJtdjdO0uMZRqrhBDDV57ORRTM7XpvC+nUc61RaX+EAZdhRd2CqK35r71GIn4NLdJCrxV625juV4Zv1cA==
Received: from KL1PR02CA0034.apcprd02.prod.outlook.com (2603:1096:820:d::21)
 by KL1PR0401MB4467.apcprd04.prod.outlook.com (2603:1096:820:37::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 03:23:54 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:820:d:cafe::2b) by KL1PR02CA0034.outlook.office365.com
 (2603:1096:820:d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 03:23:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 03:23:53
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: hwmon: pmbus: Add adm1281 support
Date: Wed, 22 Nov 2023 11:23:42 +0800
Message-Id: <20231122032343.2794903-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122032343.2794903-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231122032343.2794903-1-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|KL1PR0401MB4467:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 664ccb20-8220-47b8-7e82-08dbeb0a74a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lz3y+qGpCgW9Tk7nsH/+6fSF7BmaK3PA4GVPU0xA6MUc2rplL76PmYjQ3WcFe9ue+fGaJl7+N3GKQi1zU39m2OgY5jXRul2VuFywMPB3dCU2Twz9H8Os7g5ALYFlWq26HVamXYEB8OipR6KxwsiQi3lyzBpIkheAyJt26Rr02FZ7fOgNE9F+lcFsy99ApGATp2MeeCBaohElR26pFvNi5Cko9rGvtVYyluV0pUdDnjwthSEcFs71Uh+3ESnW9cp5NkvM4cG71AxignoDjAAUxTvb9OXQqILYmhAJpVQu3GWm/cEvVS1AgYcdu+RoKrDl7oVRg180mhm6kp5zPcEccTnSKWzUeK+NxtAZ7w4v9dbMMhl2OXMC45aH9GZiLmjbYJscBm1Ljqhi4xGvfAOZq7NeKgacs4pX7by2N3aq2i00eyqJtZfOfIF7vwVjXXJOOnPi8Buw5upNzSPWfqngFcrk/8+u8JpzHn24KyrE9Mc8Dq8M5+D7+fCjMYDHYybb2YZk+IYcrcT7VMjl8lT8Z5/lsTWI51ZbtJo5LBmkKD5qCx/ts6levpPpUU46OiIGgdU6y+tc1PQEij8BDookVcuuY21pIugaQ6jE8HRcw+lhSWauEDtqIBTQ7BORBr9stiz1PxbrRgWumwDwkyTeiWnhCjaxAe6CQxdXKoDz2jGu+RRi6G/mV0fWqIQJbyoZGc2tsQkcxxs+W/qI8OUndA==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(36840700001)(46966006)(47076005)(7416002)(4744005)(2906002)(36860700001)(5660300002)(9316004)(36756003)(86362001)(41300700001)(356005)(81166007)(82740400003)(70206006)(70586007)(54906003)(316002)(40480700001)(110136005)(36736006)(336012)(1076003)(26005)(6666004)(956004)(2616005)(478600001)(6486002)(6512007)(6506007)(4326008)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 03:23:53.8928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 664ccb20-8220-47b8-7e82-08dbeb0a74a9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4467

Add device type support for adm1281

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index ab87f51c5aef..77a358f9104b 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -27,6 +27,7 @@ properties:
       - adi,adm1275
       - adi,adm1276
       - adi,adm1278
+      - adi,adm1281
       - adi,adm1293
       - adi,adm1294
 
@@ -94,6 +95,7 @@ allOf:
           contains:
             enum:
               - adi,adm1278
+              - adi,adm1281
               - adi,adm1293
               - adi,adm1294
     then:
-- 
2.25.1


