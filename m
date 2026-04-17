Return-Path: <linux-doc+bounces-83710-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDa/Hz3t4WmKzgAAu9opvQ
	(envelope-from <linux-doc+bounces-83710-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 10:20:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3414188C7
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 10:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2E6030FC448
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 08:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DA53ACA74;
	Fri, 17 Apr 2026 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qknmRY2U"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF693AA50B;
	Fri, 17 Apr 2026 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413870; cv=none; b=rduTXFbqTaLw12vfbR5U+HLVV/k85xaUQh4yxj8Gt6MLTocFC0di7fCetLh2k5jyajqcToVD1EaUpvonq8TETZtRFBma9fVA4B7kKSsDBdaTESYsomSwREFJUV5phOpBvVExaMbmCXMNM8ujZlg94xNrA8cbRpv5ZbRCc5hdPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413870; c=relaxed/simple;
	bh=/Fbm0eKjvy8W/5XKpRKPJFvXissxWu3M2NP/JDvAWw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D48Pc9K2GnP38K5FgeChEtfKvAC1I0rFuT5OaBf/Jt1VNZXPyoh1mbI0VjNf17V3ZDUXXhNPKYkI1/eNgh+uWU8aF7ZVN9F1E+IqYH/stnDDJ+vXYiBCU+hSmQjdKy5bCekcHoBIZMTFn6H7z1GDdVM042O+sIQqbyvNqSu+JTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qknmRY2U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C25B1C19425;
	Fri, 17 Apr 2026 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776413869;
	bh=/Fbm0eKjvy8W/5XKpRKPJFvXissxWu3M2NP/JDvAWw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qknmRY2UMXVW6VhGaGPumTMohlkoUBVYYdzzXufCzEG/rOEmkRCQGbXjU9ngicNlh
	 K86KSk9huQ02bRpY3VNIc6pMnCILoGQatSwMvqq3ThehuyONgH5vA/+REyPbOKSmEu
	 duXRRfXvAH8sF2N6V+VVPfkFOMVH4gbcbsPsFTmCY6qSCTGkdVj8FXtqJrAahek0TB
	 SvzKbWdoA23aw6koBhmXDcgWjf780KykhzW6odV5lPbv8VTCRGUWyI1y8uJ69kd4V5
	 7Ogl0nNMhEh7mzLj7mqHt9gYxXWARr21VquMzV4ABeJfWS80gGLRRiqg9rMAVrJrUt
	 L20eIEB+aalIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA399F433DE;
	Fri, 17 Apr 2026 08:17:49 +0000 (UTC)
From: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Date: Fri, 17 Apr 2026 09:17:37 +0100
Subject: [PATCH RFC v3 8/9] Documentation: ABI: testing: add docs for
 ad9910 sysfs entries
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-ad9910-iio-driver-v3-8-29b93712a228@analog.com>
References: <20260417-ad9910-iio-driver-v3-0-29b93712a228@analog.com>
In-Reply-To: <20260417-ad9910-iio-driver-v3-0-29b93712a228@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776413867; l=3746;
 i=rodrigo.alencar@analog.com; s=default; h=from:subject:message-id;
 bh=X/nP5kexLBl62iqsKB8+rasjCa5LGKYgLRPHdgVXK8o=;
 b=Ri7x0ZtAET4VYDGOCLadvZRMUHRyDCLgEFj0SDLWzZaSpaMgZIDZWfckY+movK1xPD0CtpIIZ
 k3g5dInyWwFAWLvVM4xfc+BRLgujbXBCJM2CWFXogiY78HC4mHJ48AN
X-Developer-Key: i=rodrigo.alencar@analog.com; a=ed25519;
 pk=ULeHbgU/OYh/PG/4anHDfLgldFItQHAhOktYRVLMFRo=
X-Endpoint-Received: by B4 Relay for rodrigo.alencar@analog.com/default
 with auth_id=561
X-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Reply-To: rodrigo.alencar@analog.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83710-lists,linux-doc=lfdr.de,rodrigo.alencar.analog.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,analog.com:mid,analog.com:email,analog.com:replyto,analog.com:url]
X-Rspamd-Queue-Id: 1C3414188C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rodrigo Alencar <rodrigo.alencar@analog.com>

Add custom ABI documentation file for the DDS AD9910 with sysfs entries to
control Parallel Port, Digital Ramp Generator and OSK parameters.

Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
---
 .../ABI/testing/sysfs-bus-iio-frequency-ad9910     | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 63 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910 b/Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
new file mode 100644
index 000000000000..fabc2a5417d1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
@@ -0,0 +1,62 @@
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_offset
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		For a channel that allows frequency control through buffers, this
+		represents the base frequency value in Hz. The actual output frequency
+		is a result with the sum of this value.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_scale
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		For a channel that allows frequency control through buffers, this
+		represents the frequency modulation gain. This value multiplies the
+		buffer input sample value before it is added to a frequency offset.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_phase_offset
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		For a channel that allows phase control through buffers, this
+		represents the base phase value in radians. The actual output phase
+		is a result with the sum of this value.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_scale_offset
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		For a channel that allows amplitude control through buffers, this
+		represents the value for a base amplitude scale. The actual output
+		amplitude scale is a result with the sum of this value.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_step
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Channels that sweep frequency values at determined rate use this value
+		to set the frequency step size in Hz.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_phase_step
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Channels that sweep phase values at determined rate use this value
+		to set the phase step size in radians.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_scale_step
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Channels that sweep amplitude values at determined rate use this value
+		to set the amplite scale step.
+
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_pinctrl_en
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Channels that supports pin control to enable/disable its output use
+		this attribute to set the pin control mode. When set to 1, the output
+		state is controlled by a physical pin, and the channel is enabled when
+		the pin is active. When set to 0, only software control is used to
+		enable/disable the channel output.
diff --git a/MAINTAINERS b/MAINTAINERS
index 6403439b530d..edd87ee7da5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1635,6 +1635,7 @@ M:	Rodrigo Alencar <rodrigo.alencar@analog.com>
 L:	linux-iio@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
 F:	Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
 F:	drivers/iio/frequency/ad9910.c
 

-- 
2.43.0



