Return-Path: <linux-doc+bounces-95357-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vm+xBnnwTGo/sQEAu9opvQ
	(envelope-from <linux-doc+bounces-95357-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 14:26:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BB71B521
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 14:26:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dDoQnHds;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95357-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95357-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A30C83013C70
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 12:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AC63D5679;
	Tue,  7 Jul 2026 12:25:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3273FC5AA
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 12:25:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427156; cv=none; b=R+SW8Vs+OozrN3z3ivSv5mq4bgQ85UrYqxgoEX6u5jCE3aIedZPprgi04NpCICPbsH8QMvnDiZq9rWivxlZFWDAzD2mzf0UGzNQ+EAemR9+Z20EjMK+X5OhFkfV/prWzzazCiBph8Dp0OtqHNS0H/aKIUnFd1e0gIjkS0qRGOF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427156; c=relaxed/simple;
	bh=G8k2dlXjt0dLe90/5TVs36FBriLIb1uJtIxBcEBwrSE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=m7ad6T2EWAH4PPrvikajVxRfEATQf0+s+X1kzSM9dvf1BRxXHrXWyirCrWz7J/kJtbHqZuDOAjxypg94dREVM8fdztyvuEvE4ww7LoivIxJD29KOSMXhgRPZ9HsenoR5dtWoe2O/gMgZcNG6/Jf+kzCZyw6Nh3TDa3XDCi3zaTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDoQnHds; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc97653887so24733205ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783427154; x=1784031954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=26bYGBBUuDRN4zMcNcg/2GhRbjV+wNXZETCzG6QZQtA=;
        b=dDoQnHds6W63tH1uxUN3gRkykNDvHn3wLy7Ft+Q4GoN7pfYJk/yH0cK3BxAiW6xOEJ
         emZZlXc+vWjISq3XUCg1Ulbc0FM3b/K/n72Nf5xRfHYqFRzHq+P8FF9j99rhvT2KPCyi
         qZ9rlYL3MMPt46eCEVRbZHckxS6RIzqc3Omll+MYJ0f7ds//eO/ma+7LtRXcj6bSqBVJ
         k1Fwu1PS0A31msdz61Q/HEBlErZ+Qin4sXciGmg9U8aDQoR3JdQT6f3GWSzahLbXZfJ2
         kESHH/YU60dq3XzX530MXeimvQ+fd09uohkhZn6bwgAm8M3/+wOsRsWwYiiwhzOjfIUO
         68Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427154; x=1784031954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26bYGBBUuDRN4zMcNcg/2GhRbjV+wNXZETCzG6QZQtA=;
        b=RLjGSyrIgOi1AMWlaMhF+Cz/4/TJtYgjtANNTLU0QkLIIZR1Q3B3aEKzkdse/HV9V7
         qxUPm63EQsDGnAi4jsUwhcNDurYcuGKsGNmeTRfI+usj8Pbo6+1Nyakr6Kjvkf8g612L
         tT+R7EuyFaYT0yh2HPwGH/o3aFIcdh+b+809ae4wgxeS/KAIeu4bgrtgipPzWvBjDiXr
         Sa0Lcm9pzLzwj2cTe5h9HtfN9e/IN71ykVqJb6aVsMYw3DeVoX4xzbotRW8X4HgMAbh7
         /yZ6vkBR/arrCdOzWwqW/DxHJipfIBUMj2SLiQBQ0r1FmEUhPG3nNQD6s0zVmjRFqGqR
         LfbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqS7VGrzijjKsvZM5nN3UGPR89wwKGhv9K7OYuPFsnwd2DVzEX6W/sIlKGyVb+hehQtuuwBQOqhHts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PjVM7+POC5si9vD8sgoQsq2RPZrqb9HeqaaYPM8naBlfEz3V
	nHpGJqJgaEt0JZAQyBi1zlihj1eEFlPwp3WSS4wPUUNPkYcSCSVLhnTb
X-Gm-Gg: AfdE7ckxVabNcn3oIKBB8ENrutoiEgow0VSbUxy5VAJZfUtmiPqlb5YwYWmTGN3RwpK
	GZp5opdzeyFgkK0jzdlK4cgQl2GYZvyyUXnphVwH4mqEZO4DJ7pEV0fk0u95Go73TXuUAOIphT8
	Z8W9fX4iSXfw6P1ww1NhC6Uumg+OSe9QqFHPPf/vMg6MGnPDfY/4j2cDxBSKFHUwi3j3pA8tSn0
	6Jtg+n514/MooA9ejS8HsLVlBEygxug6A3U7eRRSIJKSxuuHWjIErz+d08ZjBjFW8JK/+oz5c02
	sh9tjxUthH1qQ/2mInSFyeAQL1FfdF8cnkbQQC93NbrQ75WO3+PvD3r77FPJq5ub8It5S4uaxNQ
	pEp0mPhNRCSw9w1K4BVn7oc73GD6fKGTQtQAjUn2kJ75IBsNBTMVnP8UYQ3D7WHt8fhLX8VBGTZ
	T/utL5yRLZb6vwlOQbGVQN2+8q2OS3YE1v/q+SGnntP3XgWiFwZ4rBoyugN9z+Ez5wmunEEiRDg
	A==
X-Received: by 2002:a17:902:e74c:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ccbe625b96mr46458745ad.12.1783427154327;
        Tue, 07 Jul 2026 05:25:54 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm11078765ad.37.2026.07.07.05.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:25:53 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Colin Huang <u8813345@gmail.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Syed Arif <arif.syed@hpe.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] hwmon: Add support for Analog Devices MAX20912 and MAX20916
Date: Tue,  7 Jul 2026 20:26:36 +0800
Message-ID: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-95357-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Jonathan.Cameron@huawei.com,m:Frank.Li@nxp.com,m:wenswang@yeah.net,m:u8813345@gmail.com,m:chiang.brian@inventec.com,m:eajames@linux.ibm.com,m:apokusinski01@gmail.com,m:dixitparmar19@gmail.com,m:thorsten.blum@linux.dev,m:ashish.yadav@infineon.com,m:alexisczezar.torreno@analog.com,m:arif.syed@hpe.com,m:tomtsai764@gmail.com,m:chou.cosmo@gmail.com,m:vasileios.amoiridis@cern.ch,m:Yuxi.Wang@monolithicpower.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,lwn.net,linuxfoundation.org,huawei.com,nxp.com,yeah.net,gmail.com,inventec.com,linux.ibm.com,linux.dev,infineon.com,analog.com,hpe.com,cern.ch,monolithicpower.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[fredchenopenbmc@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredchenopenbmc@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 112BB71B521

Add PMBus hardware monitoring support for the Analog Devices MAX20912
and MAX20916 dual-output multiphase voltage regulators.

Both devices expose two independently regulated output voltage rails,
Rail A and Rail B, using the VR12 VID interface. Each rail reports input
current, output current, temperature, input power, and output power.
Input voltage is reported on Rail A only.

Fred Chen (2):
  dt-bindings: trivial-devices: Add adi max20912 and max20916
  hwmon: (pmbus) Add driver for Analog Devices MAX20912 and MAX20916

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/max20912.rst              | 156 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/max20912.c                |  70 ++++++++
 7 files changed, 248 insertions(+)
 create mode 100644 Documentation/hwmon/max20912.rst
 create mode 100644 drivers/hwmon/pmbus/max20912.c

-- 
2.52.0


