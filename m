Return-Path: <linux-doc+bounces-90852-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9KXWKb6SIGr05AAAu9opvQ
	(envelope-from <linux-doc+bounces-90852-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 22:46:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 322EB63B336
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 22:46:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="PT1+lJi/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90852-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90852-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 731213093A95
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 20:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A025425CF2;
	Wed,  3 Jun 2026 20:44:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87AC40910A
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 20:44:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519448; cv=none; b=NesNrpXxBkT1QTKzTrJUeNWdovoKJ3Af27oyBTC01CaXUB6wnDub2mrLzUXGEeTLNvYteM3nX+Krd06JNS9hToLWJsQxuPI5Mx52V9bbB4Qtf8tBUmFLv7hdhb49wZ2fxDJ6zaDAOIKJidnlUdl+XMCnbliWdTcQYQfGCiMV/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519448; c=relaxed/simple;
	bh=1VgHiEy4LZCKpTLkS9uhtOQ9zMOOI5+2vy09ZAAS624=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhUB+b8fsVhBw0ykFis5rdVrmPQdOyxBB8Ktjsi0TjWsPLdIoFXGvH1LSJD5wayYBje/0sgi9Ucgn7tC1+lf7R0VxvFhV5+6ZA7BmcYAj1LEuZ+LOjhHt1xEFJ60ZcQ5UWV9uk1uZXu1mR4pqeOz211TqQhPJMjrHH5zbOLEYOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PT1+lJi/; arc=none smtp.client-ip=209.85.167.176
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4863ee8474eso1976325b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519445; x=1781124245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWkxW7Ud9tasihZM1AsETVa4enpdjUpARrEAwS6/9NY=;
        b=PT1+lJi/dVYSSC+fFoYHIJrGX9eMjKdSl476Uq9/CyTks5EULnBzI+7eCrWu9tCyl7
         Ld1H8U7yUkY7YHV1symkS6+rVED9QEQ3JN/bckDHENZc2zy4lUWMGCkC0pV55dNgRQ30
         c30GJghRC2z2yv3DxxpteL1bPrBx0EBd9iIWLLUztI7M63Fe5jrl4C8wE8VtOMtlAQX0
         WNo+Gh7X4gEUz0IyrgvkLEk5rOPzRl0JoXTF7d4Jn0w1tDWoXvbOFgBTdsIjzvPFrgzz
         Yhxx9TBiuxpTtU80FiuhQNCII8hH466uUQw3YDokhGYhIR6N/DwYkfA/nx8w1Me5qpoE
         wAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519445; x=1781124245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HWkxW7Ud9tasihZM1AsETVa4enpdjUpARrEAwS6/9NY=;
        b=HvVCIOo7WUksz3cYwapx2F9ZaBCM+csgt6W0qYaKoDnWFI2RllunmOrHK1q3Xg6Kit
         kIVMJbSR+bvkCOA628N7evOVbmr22isVEsZMjQ+dSCTAV6iYSzi87Y8r6sbfwj3t8lpf
         +uFQn1ZRnNAjxhHpV5zI8bky3drHSEIYpQ99pFm8Dyz/j8R+/MGe+U6iYMhI2r4V5ehr
         qhlnmLm+0Jq5nyp+vEHwO04WntlTn1BJmqQSAlloBp5kIEHSK8AYecOjWAlKSTJwt22w
         ZrEeog0gIs1K8mXmrGPUNKOmDaoIsVN7qpmBgh+bHd8mIp1yu8921PTiGlglNn9oszia
         EV7w==
X-Forwarded-Encrypted: i=1; AFNElJ+Fga8U+OrdXQDE9I1syNojp5qO+/lznM+bxb6bFKzuuZfmG/xCvLosm/ImvcNhNiHWIu/sneiUbhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwBCxGvCKs4/evufKq1UC1xXs/7sd+yFysVy78QopXlKi9wj2Q
	8YC1OddcbtB7jODxw4PfanW/OnJ51AFFUJTCTGsTU4bJoKVFiBNDqeKt
X-Gm-Gg: Acq92OFjAgVJYNdIU0FFXxd8XTEp5p85313O6XnCZrJsiv6ILonPbFM/n5AJAD9XTmG
	urZtsfXLYvSParbuJA14nfvgbPakO7TpKO/+eMKQz7eoVjNcqRp+QxiFkKHb1LYuBoMwA7Ucfmy
	UaW0rKhzfui1jgWabUzXfUsasSKOq2CcPrvgJrCwcn1LZippzmWbr1fZxI8d09A4JsrkoCnhN2v
	+HzJMsr9uQePiTIj2lbPi0J5CZ+UzfXykgZsTqnOrtX6Lxf8EpOcBI/CDnEr64QCaFIFY/r3D1R
	Pxi1G2iHat+cyuPgNi/tKzBP9FQCI+LugISk83Mwk1xQ4DiYQhueUk9PdUMmJ8KcXiYnjlVaAOS
	PsnEamqP+BPN3MEXa2uos812IudPWvm3eW3e9ios5Dpy7BV9SWjdBEpf2gZlb6o6Fa1QxJTZqie
	jcT98Wfwd+4nWW9akAj/tQ7U3SRs07ZTuqP+aDPEiiQfQ3qgBFTg==
X-Received: by 2002:a05:6808:1a19:b0:467:58e:5d4b with SMTP id 5614622812f47-4865ab31ed2mr2926769b6e.20.1780519444730;
        Wed, 03 Jun 2026 13:44:04 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2667962b6e.4.2026.06.03.13.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:44:03 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Wed, 03 Jun 2026 15:42:18 -0500
Subject: [PATCH v2 1/4] dt-bindings: net: remove obsolete mdio.txt
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-remove-redirect-stubs-v2-1-c8c19876ab64@gmail.com>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Akash Sukhavasi <akash.sukhavasi@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90852-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:olteanv@gmail.com,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dmitry.torokhov@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:lee@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:akash.sukhavasi@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,m:akashsukhavasi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akashsukhavasi@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 322EB63B336

mdio.txt has been a single-line redirect to mdio.yaml since
commit 62d77ff7ecbf ("dt-bindings: net: Add a YAML schemas for the
generic MDIO options"), which introduced the .yaml schema and reduced
the .txt to a stub in the same change. The .yaml has the same filename
in the same directory, making this redirect unnecessary for
discoverability.

No files in the tree reference mdio.txt and it has not been touched
since June 2019. Remove the obsolete stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/mdio.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/mdio.txt b/Documentation/devicetree/bindings/net/mdio.txt
deleted file mode 100644
index cf8a0105488e..000000000000
--- a/Documentation/devicetree/bindings/net/mdio.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to mdio.yaml.

-- 
2.54.0


