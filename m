Return-Path: <linux-doc+bounces-91683-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tXM5JhkxKGpv/wIAu9opvQ
	(envelope-from <linux-doc+bounces-91683-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 17:28:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB8661BC0
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 17:28:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FXEgfN6L;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91683-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91683-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 705003091C4E
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 15:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E27492513;
	Tue,  9 Jun 2026 15:13:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E09492510
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:13:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018014; cv=none; b=YPyxdlvi4lKNQAJhbQkbbIYyPAcd9mCUVv/snoZEDWzYekWYrud43dsU0OYFcPIGIm0cmCXC4gNaD1M96FYvhEA799TEG2I5dKfdi315j9+cL8KatEWsubyoS5PJppsy5QWUmGsF/2NrJSCHRroxXR+8ohZ/aVTwBKykR1KxkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018014; c=relaxed/simple;
	bh=22JVSQJjGwljeiZ18Gw1sbCII4IMcchJHTBgkArVf6c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BznjuLJEDvjz4p/LH3FfASRsU/0iv64PwveJLCwBwLcljY4FDFtUnBvV5xnrAMaVEU5HC3aQIW72QIVjYYOcEFVxtkgleRwreva9tAtJfh3gcNK1HPmh4OljxlmK2iilEL8MGsBFRHgEV/fgIV8OUJfbQpScX6Jmumwu3eXuqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXEgfN6L; arc=none smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so8160544a12.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018003; x=1781622803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=FXEgfN6L1Sq9TXRgK/T4lKpB+1arlqUMK4ABXd5vTaVjegpJVljqcDsuRh5dRd1mMA
         M/LV4phtc4JRkyAv+k1Oyq7zxJ9aDnV0wQxnX0RO0Qb9jPiA2ZfO/w9Ygf1GoflDvujJ
         pf7zhPV6flBXlhWach9y2luV6AdMAP0zVXHTVnsYOV1lPLTvzATJDoPAJEq7DPBUgJpj
         a8AgQMdqTubUMW/bQYtp74cUv/gKVZ48Z72r6PMeZn6zD2BGzszuBIjiC7VbRpEjLXYz
         21HSRkeqB2/tX++VeAzs/F/VHwh69g8hqf3MyroIMsKtCzVLt1M7rnRa3lvLLGfbjDRQ
         f94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018004; x=1781622804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1RxjqPGCItI5U8gOH4PdQCpjTve/F/Wr30HG8OpZBE=;
        b=l68fzVSFreqeMA0UM55qJRcVZUA/qfizqmSYh1QasAz1KdBs78PlZfxKlBSPTttiRC
         C0BcUBQB0zQwr7wChTLrT8vwmdQt0jNydZenzThLe78pmkkq8rv3vbuLUP0/VoqzJbFa
         6hS2LHrq6h/KSHOv9EjdmC0ev1qUsoVxYLTpOrgrllLQN4f80HINTh9DPJBHzrRpG5CP
         EU+AUVviwZWeIxjCdaB5bF1/Fks4+jlu0wSCUvULcqvobC1whG09UKX6UE6pHKuCkMyS
         u6wRLg50K3wzxTwVj9vkJWHVIuU9tUyVv9Ay9FJR1zd5ff+XAio87Vc0xwe47G7/wLEC
         PymQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qeO82LxvEkbNpJjUoSmjod7jSlOCHP1DMNDqR9OdmGjKXLgOIDHVN4gaN2j9el1ilkDBevNlhS80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvmO4k0Z6f2ORdc5UWdDrjwk1gQJFnFOFgr/4/WXNsPaqVuaJ
	1RGXtvCeojGDNeu0PAf/rRsAfU8fkH5xooSoW/igNx7JDikWcrNFX1Jf
X-Gm-Gg: Acq92OGP+f8Cdz8TLMviJverlIlToHcZbcpRQ/Jbiq7V6OHU0cbu44ryulgJBQEThDe
	kJPQNzQIQDMFPHF6Nnew90Ts2CeLft4lbEHvIraJap3T1PBkFeQOOzHjleDBo5L8OfzCyQhsWYd
	AauISHXTHpEnunYPL3otL4JyDmHsJXvoJCB8S+yHjE0eu5AbHNC28RfP0dfDjXe6VqLNdI7t0iW
	IbfCIFu/Dwvi3UrOiJrLSsZjyDCZhLNvX2ts0dUexxwctwbfJ4MgTZGwf/OCctmWyUAxXp8Za5F
	tWunoVI5ZQNY5K7VvjJsbIEMtN7aFEAhSpOYV4nFR++BP+0T0egl8Ce2MMplusz5Rx+ro+396aM
	+IJRjqMLzgYTNI+va396wfGt7JdCoznJ4S9vTbNUbsdEFrnU46EKjizzpgENRFmS4QLggY1x2Ax
	DzyO4pQ+gLait7fPQoKnbhKqA1aN1OnJP7
X-Received: by 2002:a17:907:724a:b0:bef:1df6:12de with SMTP id a640c23a62f3a-bf36cdcebf5mr953590666b.0.1781018003482;
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue,  9 Jun 2026 17:12:03 +0200
Message-ID: <20260609151212.29469-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91683-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[ansuelsmth@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ansuelsmth@gmail.com,m:lorenzo@kernel.org,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:p.zabel@pengutronix.de,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:llvm@lists.linux.dev,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,gmail.com,armlinux.org.uk,pengutronix.de,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev,dt,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFEB8661BC0

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb8cdcc76324..8174f005ab43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0


