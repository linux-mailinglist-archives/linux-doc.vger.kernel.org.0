Return-Path: <linux-doc+bounces-95358-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T9rXMLjwTGpRsQEAu9opvQ
	(envelope-from <linux-doc+bounces-95358-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 14:27:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B167E71B554
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 14:27:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o7FdmV2i;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95358-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95358-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B80DC301DB39
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE2B40A927;
	Tue,  7 Jul 2026 12:26:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC53FF1C7
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 12:26:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427167; cv=none; b=X1vJZSVTqAEt50uSJh7mqYSEzEgy7YUFKAoXPMjrOsRUY2gp0eQWbpXCh5g2XrIGz4rH5IDQ3MIHfz2b0MPkh8JZKorC6aRJy2oT+gyqlhQ/LuyGQwsiEwvCoMW72svy5DgSvq59p7NPkDDd44bgU8KvJ6lTk85mahuiu+vty8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427167; c=relaxed/simple;
	bh=FH8tcHR+Kf/Q4WoeEbtw1NyA3aDEhztHlh0tNOOUXJk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikPfmWccpeLclO/slsRH2U+TgooNEMJJ1sBc/yeR6x8af03JLAciPRDN5hWzQVln8GY3pAfmi6Ntgcsak377fZCNqD0Ag7OX989hDjUBbHhGG+/dvGdO9ckJ1OyMLOhKOLORJ8b4K/TVqcEsejXe4prpCbbKyST/eXIKGjXwohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7FdmV2i; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c7c61b5292so58862835ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783427165; x=1784031965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IgLtos+kVckpvEahUESh1dXWtYuNLZ70j+TeV2rQ4j8=;
        b=o7FdmV2iz1KaHdVLavYCaIRIISC/kCF8tM22letnR4qRyL4Zw7/ApG3Zz0EeTngp/0
         NfNcqYYher43e35vSpifNA5sgX8b8OHo5aWJS3VlBA594YUqE7JqlD3/M1zIc0glYzWH
         6wQLsEPgzE9Wzvzdf39Dn+VEjGhk2YlRZkTSG8gVzFyZHCAGx4erkjksjNXaZrEECOIS
         04E3gRICbwRNSzKVCs5Ukj0Azyo/IpIZf8j1Di32uma0iW4K+dsOBvEV2zhIgwk71Qqp
         fK5B5M6//dwwMqUlf1GoV/Jo3WcrOkmM7TFeaEflB6TUtKBTW09ZNpZPrES2xi/4hEmj
         inGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427165; x=1784031965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IgLtos+kVckpvEahUESh1dXWtYuNLZ70j+TeV2rQ4j8=;
        b=rpVwnmYlilLLhG4/nTR6Iccja6vsmjg9YkROHs9CYHJBXJAYhLhS66rgo7VipNDdF/
         8akg14Gnw9zb8ZyScfpDqKZZ5yYv545MKZuvvgiIXXJCul9cNwiqxMMi/6MJ0FyN/v9k
         LpqBbucM5H7W29ggeagUtuNPtgez62g3GDTcwEoYFcdbUTNIfTFfC6jtJv9F7dnV+poC
         zptEBGZsJoX5g087ctTZdQtRb08bIA0AxwiRtG/eAv026OAV1nHSnQium7qLHBK90v6s
         jcbKXQ1Xfx5+QfHTEOJdiaZSV+k3ROw2UM5Hpfa2rRrGBEYYKEFTo7p3E9d0iiETxjAe
         hdYw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2XtLH40a/LnTqmb0JnHXTLtb7gX8BNCoYZd/eHKXzeL8Ic6TM63yn7EAJ8pt4fsZshPfpemer+vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwtXUQIvxlruV5Vr+S5TG1dYUYDj/Tq7+F3N/+mvrm0yHKRtG
	qRlQ1fE8ZD6G6FSNFDJWBUByEVsmm78lLyZwdsVD54ZyTujmzU69Y/lt
X-Gm-Gg: AfdE7cngnAreZrogmxykzlYz96gYzqQEhuRE9wiDSBG/f/VR/MzqvEQaJs6SDHtmPae
	ZWBdMFeQG7ytaSxXpfeiVab6ceKUcccP/L29NMu+AOoiQ32E6lagE+wEujuLD5MeeJpIg5uKggL
	AvM6B8g9QW29Mkbuf7ZBjc0UUAv4Hbi36r4ln+cV6Fy8ZDl+NudSEQUHhAuJRETvEBx2fxNJRyH
	sblR1sExACPZBqyhpKFDKzSZltzbt6gKAMpYbBQtFgN7kmo7SqSiP0/oUnaJQQ9i0QgQIij0alc
	h3leaIkrlyriFD8gkeXAFQgVhGZu8nhkOqkGdVxOeRvQlKVz1yOJP1qwInrYTS9v4UZEWAHqaEi
	sMYUNSIUSqFF1GRzN1BhnfiqZH2yzeWWRwXc51weO2PikSAMLnQNnGbty/9Jqz/iJjzs/LL+0+B
	5NrYZAD6hzktWlu4UGA4zwnCSWm1n1S85Re2W+8C/exbVc2trgzsek0PhXnDeoF/JXwQBzQfHMN
	Q==
X-Received: by 2002:a17:903:1c2:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2ccbf184d59mr49746515ad.39.1783427165522;
        Tue, 07 Jul 2026 05:26:05 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm11078765ad.37.2026.07.07.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:26:05 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Frank Li <Frank.Li@nxp.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Syed Arif <arif.syed@hpe.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Colin Huang <u8813345@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add adi max20912 and max20916
Date: Tue,  7 Jul 2026 20:26:37 +0800
Message-ID: <20260707122701.751878-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-95358-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Jonathan.Cameron@huawei.com,m:wenswang@yeah.net,m:Frank.Li@nxp.com,m:chou.cosmo@gmail.com,m:chiang.brian@inventec.com,m:apokusinski01@gmail.com,m:dixitparmar19@gmail.com,m:eajames@linux.ibm.com,m:thorsten.blum@linux.dev,m:ashish.yadav@infineon.com,m:alexisczezar.torreno@analog.com,m:arif.syed@hpe.com,m:tomtsai764@gmail.com,m:psanman@juniper.net,m:kimseer.paller@analog.com,m:abdurrahman@nexthop.ai,m:vasileios.amoiridis@cern.ch,m:u8813345@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,roeck-us.net,lwn.net,linuxfoundation.org,huawei.com,yeah.net,nxp.com,gmail.com,inventec.com,linux.ibm.com,linux.dev,infineon.com,analog.com,hpe.com,juniper.net,nexthop.ai,cern.ch,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[fredchenopenbmc@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
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
X-Rspamd-Queue-Id: B167E71B554

Add device tree bindings for Analog Devices MAX20912 and MAX20916
Dual-Output Voltage Regulator.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..5e7fb4edb82a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -57,6 +57,10 @@ properties:
           - adi,adt7468
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
+            # Analog Devices MAX20912 Dual-Output Voltage Regulator
+          - adi,max20912
+            # Analog Devices MAX20916 Dual-Output Voltage Regulator
+          - adi,max20916
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
             # Aosong temperature & humidity sensors with I2C interface
-- 
2.52.0


