Return-Path: <linux-doc+bounces-88048-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB9oOWYLCmppwQQAu9opvQ
	(envelope-from <linux-doc+bounces-88048-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 20:39:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 698405633A2
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 20:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFB1B30221F3
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 18:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6A83CF692;
	Sun, 17 May 2026 18:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcrruC1V"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7943A3CF045;
	Sun, 17 May 2026 18:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043096; cv=none; b=REoqx5cCmX/albaXXJYJ9Ucr+AB3FgqNgtoUI0PtFMVtq4w7BNXK5uj0tDO2PQOZdtJ/50uB+C2mlhdh1L/9BXQG09V8i2ma9DqiWXCJ4RvvmRalSnKq1QER98f4NKKY8FK+86HAJK8bEYDu6Ck2ArYvjA6t9bu2D1m8SRR6yy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043096; c=relaxed/simple;
	bh=2dSzBuo6NGIU/MzLmZIMIR/j3XnHkSP0ZXWfWsJr7aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISoXKuvwdKEnTXOS/MpGwEosuHNbSmKww5FR+eaORNKh4OVSCV3oVsRy58Vs0+1nq4s22W7a5GQ2dGIV1D9gSJFawm4BinIcqJ3jiZED39Ug+oYV32pdpWqWiEWgXOYQgvZhNwieJgJM6DRfPFuIkqaMiPmsT7FUTV88U3GGzwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcrruC1V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5207BC2BCFF;
	Sun, 17 May 2026 18:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779043096;
	bh=2dSzBuo6NGIU/MzLmZIMIR/j3XnHkSP0ZXWfWsJr7aY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OcrruC1V+l+oEwuXlQCaER3JnXH+mlh1PUHmEDKUsYW6WCrfoVo+KylgFuWLH/9gW
	 gpoFSGhLB3ulkLCXajlXTIpI7nQYo8Sll2z14neiVgCNbrpp5rZPDTYoAd64h0Hnhi
	 MVGQ9ZPHzrmRF7h1K/rN9tAcK7DuvtKpYd2fykDrJuX7jmYVjnpojGjjGGFfvavfjM
	 1M0S3L2rvZ8p6vxA64ZaF0UG2L0TTO8S0oLBbu5+fujFnUsHRCph8IES9W32zgIgIK
	 GsSl01cphHysY+NQXk4ExvatOKhxkSi6bzficQOglF5rG5d+qcaVZUZNxzRILdVNxn
	 CvyifCrCMe7+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45781CD4F4D;
	Sun, 17 May 2026 18:38:16 +0000 (UTC)
From: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Date: Sun, 17 May 2026 19:37:48 +0100
Subject: [PATCH v5 04/13] Documentation: ABI: testing: add parent entry for
 iio channels
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ad9910-iio-driver-v5-4-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com>
In-Reply-To: <20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rodrigo Alencar <rodrigo.alencar@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779043094; l=1464;
 i=rodrigo.alencar@analog.com; s=default; h=from:subject:message-id;
 bh=XOyaqKzDL3PPgyWAcsX4v184IyQlIm8Au4yWWWsAm+k=;
 b=rZVnmvddX2rI5fphSz4iKSZnXP3zEVP+jKYJeq7KlWz+a8soPLFMO3QB8k7Yy2cXZPLWNMeaB
 ZDzkhX63Qz9C/gMYJ1GSUy1dL6zNyul++R5Czl7FJMSuEwPY5OEI7MM
X-Developer-Key: i=rodrigo.alencar@analog.com; a=ed25519;
 pk=ULeHbgU/OYh/PG/4anHDfLgldFItQHAhOktYRVLMFRo=
X-Endpoint-Received: by B4 Relay for rodrigo.alencar@analog.com/default
 with auth_id=561
X-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Reply-To: rodrigo.alencar@analog.com
X-Rspamd-Queue-Id: 698405633A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88048-lists,linux-doc=lfdr.de,rodrigo.alencar.analog.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[rodrigo.alencar@analog.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,analog.com:email,analog.com:mid,analog.com:replyto]
X-Rspamd-Action: no action

From: Rodrigo Alencar <rodrigo.alencar@analog.com>

Add documentation for a read-only sysfs attribute that allows to expose
parent-child relationships between IIO channels.

Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 925a33fd309a..399944974e34 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2118,6 +2118,19 @@ Description:
 		specific attributes. This is useful for userspace to be able to
 		better identify an individual channel.
 
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/out_voltageY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/in_altvoltageY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_parent
+KernelVersion:	7.1
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Read-only attribute containing the label of the parent channel
+		for hierarchical channel relationships. Only present on channels
+		that have a parent channel with a valid label. This is useful for
+		userspace to organize channels in tree-like structures that reflects
+		the physical or logical relationships between them.
+
 What:		/sys/bus/iio/devices/iio:deviceX/in_phaseY_raw
 KernelVersion:	4.18
 Contact:	linux-iio@vger.kernel.org

-- 
2.43.0



