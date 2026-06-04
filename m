Return-Path: <linux-doc+bounces-90874-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 78+gJNXuIGq19gAAu9opvQ
	(envelope-from <linux-doc+bounces-90874-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 05:19:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C5663CAD8
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 05:19:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZMUlbi2F;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90874-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90874-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABE1F303C420
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 03:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A71038AC78;
	Thu,  4 Jun 2026 03:18:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9F736AF6
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 03:18:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780543132; cv=none; b=npnp0AnNKx3Xk9+Zu3xhWTt51s633OyQatxz0e2OZH3lqOXTe+JcM2DrAsbUlmY0hjNYwfJ2ON8f7QQPavaLlKKbixriP2S8mklq4y/ncxabRYeyZ98gOZUs8Ei1OrO+A3VVZBHgOcAbS2S+01tKZJ9TWNDY2sU2dAfc+dp8jqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780543132; c=relaxed/simple;
	bh=g1qEP2JiXJypGyDZXUHYnPGMKBqMzwNZO0Yrb0XezKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oK7x+zxTD3xyrbizOXq/XtywNALHaUEBmvQQVwM+y30pLjmoAVcm6CAZyGB7iHW4OtMndobi4Ye9ieUv5pwh3HOD+DeFYMQrkuLecXJ7peVAREAXGEkBCI0m3jW9gUUKZMcQF1NNXEws6ScHmHl1ctAj5yA95q7OkzwGPdiGhp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMUlbi2F; arc=none smtp.client-ip=209.85.221.169
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso67652e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 20:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780543130; x=1781147930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABgD1ITrwmBzT7Q0UMrUoeX4vI9VuqpvvCbVh1BStcA=;
        b=ZMUlbi2F9JdIAcrAdhuOT+dqBHWcQzh8nHVXjxtr5s81z7AsPOYhHwjTXmSZTdIEXS
         +pu74HkUdRQWQAcIdBgero3EnxulaB1e8caDhUDHRkKQAd5jpboQRfEQBT+jBd8t9BCq
         4ogsWbO0wSQp0Hnh0IwYL88vaG3R2gyXe8GqmNK4q78Zg5DoC5fTTL5THDC2hNIWugvS
         m4lUWJ3pMZ7Vkky8hEfSjriUdSbzAoRryKW+sx3qmmFEB3LFeBt4QHSOQAX3LzPmHB3e
         mpaWkRLXG/lwnYG9z6cgqqnfBWyVG4KYsknd3/AXmw7S2HFBVI4FBY+LXt5SFaB3QVq8
         Cp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780543130; x=1781147930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABgD1ITrwmBzT7Q0UMrUoeX4vI9VuqpvvCbVh1BStcA=;
        b=Uers3HdlGUUw2qfAObNJxjtq9DZ+SxwhFehkAHwwwrxpzn0SKQltJOOackmTR+Z54V
         jysAeQX5/dOVL+E+ND8Tge76t1xHdoJCi3twyPqmZjmr5pBGfmxXxoOePhqktSFkM4Wm
         33VSP0ka2sYhABHvuoXjzendGJn5FAFsgN0GPWnfcZovVynthyqqRBRlWGXPWr8gTbWK
         iwIb35hDbVxmweh7c++LFIP1k5qBqAk8cCReUdD/ybnUv2/KLAmvR1hqQeJYLMaEyYJE
         AdoxYABGDfV03SyAhi+3Bq5oVxjipitUah+A+ON7iiOEJ4lgL+JCDq6GDXWjBdKntX7h
         PzfQ==
X-Gm-Message-State: AOJu0YyxVGmwSTr7ZhLKNi5bRKCkvFgeCx2ReNo9VcwyCtkMCfO5IAk/
	JHUftJyXnZfWWBGTwOJ8PtUuBUiOw1GzHRao3jwM4a25z3v8X0J+wgxQ
X-Gm-Gg: Acq92OFfSJh9TnQtFEWUAnq0eu7TborSmXv5vbaCSqqEx8pBekSfpxwEa6R1Fnxub8Y
	CFiJ9cWAEXxXhAvg3szHtdggsuWZlTySO2lVH+14eb2H6RupxA/rOSbTFjkH6Z8V0Eu+wsHldAC
	DwJPENrbria9OD+RRE5LAO7SCsYEwsk0vO/wPgMJy6RUBz46UqKkzU8Wh+++4tzzibTF+zF050T
	wXNjnkHEcAkEkiDeR5m5oVA7YnPGVDeoMSxPy6R7F1kp/eKlKBNNnwxzcUY9yFLeJGYNBSaGTr0
	mNBVAejwA81NSRVJwduMunjXcyaOm/vLiIiYhfIt4lr/aTNErhOl+PpB5Zn9ZUjY+s5UXqfa+uk
	e4FK95aa2h6vd5lmBP62/6XXjCjT/E7kcaMlCxtUN13fJAq1qzQnOYZI6LPmwi9VYVENCh3khiK
	tzzq3Fmr4ZopXhOXkTN+gSsQCi0bdgQQ6GbEjnOZ5fwQ==
X-Received: by 2002:a05:6102:1499:b0:6c6:74d:e09c with SMTP id ada2fe7eead31-6ec2ddc8f70mr3305928137.11.1780543130030;
        Wed, 03 Jun 2026 20:18:50 -0700 (PDT)
Received: from localhost ([2804:7f0:3d7:5e7:f9f4:fcc8:ba79:ce46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96414113f1bsm3658612241.8.2026.06.03.20.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:18:49 -0700 (PDT)
From: =?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org,
	=?UTF-8?q?Amanda=20Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Subject: [PATCH v3] docs: pt_BR: update "Purpose of Defconfigs" section in maintainer-soc.rst
Date: Thu,  4 Jun 2026 00:18:40 -0300
Message-ID: <20260604031840.17236-1-amandacorreasilvax@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90874-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[amandacorreasilvax@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:danielmaraboo@gmail.com,m:linux-doc@vger.kernel.org,m:amandacorreasilvax@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amandacorreasilvax@gmail.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2C5663CAD8

This update includes the "Purpose of Defconfigs" section translated
to Brazilian Portuguese.

Signed-off-by: Amanda Corrêa <amandacorreasilvax@gmail.com>
---
v2:
 - Adjust translation of section title to "Propósito dos Defconfigs"
   for better clarity in Portuguese.
v3:

 - Fix plural agreement in section title
 - Clarify that the referenced device must be supported by upstream


 .../translations/pt_BR/process/maintainer-soc.rst    | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/pt_BR/process/maintainer-soc.rst b/Documentation/translations/pt_BR/process/maintainer-soc.rst
index 5a3ae213e..eb8040a62 100644
--- a/Documentation/translations/pt_BR/process/maintainer-soc.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-soc.rst
@@ -8,7 +8,7 @@ Visão Geral
 -----------
 
 O subsistema SoC é um local de agregação para códigos específicos de SoC
-System on Chip). Os principais componentes do subsistema são:
+(System on Chip). Os principais componentes do subsistema são:
 
 * Devicetrees (DTS) para ARM de 32 e 64 bits e RISC-V.
 * Arquivos de placa (board files) ARM de 32 bits (arch/arm/mach*).
@@ -220,3 +220,13 @@ A linha de assunto de um pull request deve começar com "[GIT PULL]" e ser feita
 usando uma tag assinada, em vez de um branch. Esta tag deve conter uma breve
 descrição resumindo as alterações no pull request. Para mais detalhes sobre o
 envio de pull requests, consulte ``Documentation/maintainer/pull-requests.rst``.
+
+Propósito dos Defconfigs
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Defconfigs são usados principalmente pelos desenvolvedores do kernel, porque as
+distribuições têm suas próprias configurações. Uma mudança que adiciona novas
+opções CONFIG a um defconfig deve explicar por que os desenvolvedores do kernel
+em geral gostariam de tal opção, por exemplo, fornecendo o nome de uma máquina/placa
+suportada usando essa nova opção. Isso implica que habilitar opções em defconfig
+para máquinas não upstream não deve ser aceito.
-- 
2.43.0


