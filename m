Return-Path: <linux-doc+bounces-35075-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE6A0BDBC
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 17:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97F5D1884485
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 16:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C4820AF67;
	Mon, 13 Jan 2025 16:39:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A0714F115
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786386; cv=none; b=rYPmo7SKRjOZxYgeux3HF9LPrXYFeT0Zx0uK5ffyfK69/sTU6DGMWsheY84PheJ0R5d1y/LloQlZSX+cb8AL2tazH7xTpVmQ+N6XXSThJSTRiyYy4RBfs2XTtJIHY/+D4bILabL5zUsSvNZCW9g9Htc4W8vBaE7pnrXVfqmLGQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786386; c=relaxed/simple;
	bh=bIet0sSt0htpcx1JHEcCUyCD45/LA4jWGaGLBnQOx88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLITFbdybxuAVkjcc7zRPafGB6QYa22hPM/MpbQdZAnxr/WRhe9DkJWP+aj+gxz7b/XDdFEhfob1dIIiMeGjSSoqssJGN9Q925/r7gtM5mv8ssyrPjczhXLvD3aYmY3Z0eSakWzyKuSQfVS4xruPoBnfRkaQtTBSRtbr4IFcxrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXNTL-0001hJ-Ks; Mon, 13 Jan 2025 17:39:27 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXNTJ-000I5l-29;
	Mon, 13 Jan 2025 17:39:26 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXNFq-007FQL-33;
	Mon, 13 Jan 2025 17:25:30 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 17:25:35 +0100
Subject: [PATCH v2 10/12] dt-bindings: thermal: give OS some leeway in
 absence of critical-action
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-hw_protection-reboot-v2-10-161d3fc734f0@pengutronix.de>
References: <20250113-hw_protection-reboot-v2-0-161d3fc734f0@pengutronix.de>
In-Reply-To: <20250113-hw_protection-reboot-v2-0-161d3fc734f0@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Fabio Estevam <festevam@denx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Serge Hallyn <serge@hallyn.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org, 
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

An operating system may allow its user to configure the action to be
undertaken on critical overtemperature events.

However, the bindings currently mandate an absence of the critical-action
property to be equal to critical-action = "shutdown", which would mean
any differing user configuration would violate the bindings.

Resolve this by documenting the absence of the property to mean that the
OS gets to decide.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/thermal/thermal-zones.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 0f435be1dbd8cfb4502be9d198ed6d51058f453b..0de0a9757ccc201ebbb0c8c8efb9f8da662f8e9c 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -82,9 +82,8 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         description: |
           The action the OS should perform after the critical temperature is reached.
-          By default the system will shutdown as a safe action to prevent damage
-          to the hardware, if the property is not set.
-          The shutdown action should be always the default and preferred one.
+          If the property is not set, it is up to the system to select the correct
+          action. The recommended and preferred default is shutdown.
           Choose 'reboot' with care, as the hardware may be in thermal stress,
           thus leading to infinite reboots that may cause damage to the hardware.
           Make sure the firmware/bootloader will act as the last resort and take

-- 
2.39.5


