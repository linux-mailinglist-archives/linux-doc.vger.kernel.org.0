Return-Path: <linux-doc+bounces-50867-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9EAEA7C3
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 22:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04E0E1770DB
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 20:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FCE2F3646;
	Thu, 26 Jun 2025 20:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x4CA2EDb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8685D2EF643
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968359; cv=none; b=TlOdbZbT7QwqICJ9itfssbHsLHqT8Q07yXUg/AA9CN/XHEv6u/jCPVHrsh260G7zAbeM72q6Gu5E5ctB9vXgsx9G8d5fVWTLHEzyKKZJRIF1j//w83lqTjmSzRbCT4FkaRCdvo22j0Cj8bl644FbV9hsLtr67h4hbWXnj4rN6lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968359; c=relaxed/simple;
	bh=bO4sw7/hINJdmJB2o7i6RovRyFWviPuCwq5wxaiI8Bs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qsiSZFdQo6al8Wjxa/5G3YsnYxKdIsuI2yW7NqpvIdNikoQtgr2oP9nGxAim0UXO8Qdji3cmxtRuieTbQc2ovjZaAGse0OhgplQW1vAzh3++dJkTZyFp6XzQWs431ZL7jT8p7SJuSoi0EQk9f+PzELBhlFJQzrUUbhzXyTtv6LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x4CA2EDb; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2ef38fe89d9so863247fac.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968354; x=1751573154; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPJCCS28P/ht0GkmQnG+3GK0DAvT59T6hS3LwMCctEw=;
        b=x4CA2EDbEizTS4SuUHPzydjNoZurxTQT4UJ75wifRxZKdNfo/bZSyJz6/1ck+TPUKq
         XN2yyz7jpUbd04MU0+4gQFGNlzn0u0+sv5wiUO0FfoJbCQxNEDEjATLEXzGZVEh0jDVG
         ZX9G7CEcqbH0dCOCRXlBsOBEnqT0/ze3Lekaax/pEjsnRjqjGAZqwgdFreZ7ZoU8/gv1
         0yE1eII/CfrZ9cMQgDmRDe3s0pBHwKfOiVwY/RN6m3cNwblLmE6OpTa9+NG4vKZG5jYL
         AdYUxeArtZORepDKNrrV4YW6j4alCORUiZ1mMz8jhGfI8MbqlGi92lHo6zHX25wFq/Wi
         oWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968354; x=1751573154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPJCCS28P/ht0GkmQnG+3GK0DAvT59T6hS3LwMCctEw=;
        b=PiKjksCc+GhK5/xBaQWiipBAn9yjLx1o3cIEVIx9ZhGFUUap69TB9Zcwdlst0Aubig
         jpYPtXikXjdJr8Wdd6GAZAZk9Uymnv3V3rgPuQ0yirYqDrFmj1J/DHJd/DrWRiBhbFgq
         2LXMdPxbJWpHlCuhv8AN2XH+WIl6z6W8Ah7FCGOhAgGXVJJ4hZJBAJZX+IMjEhCjfv+n
         +CCD7fFxLtWTkXT7LGzYke6xop4k0Oo4B9yIInSGjNuOko8QbC+2l/+wpuKdSF4qMEV4
         CtZH8SceY3aZZzkf2+cdusAPPIk8ri9Xxx5aKwYKAvpjpbEx1gAAijFfOqzoFvrcZtpy
         tkBg==
X-Forwarded-Encrypted: i=1; AJvYcCWYwB5eZUgxmeMAYY18waXywfKC/r6bEgoIeXWDB68uwCCwz6ML/7Q+qRVftVzMXywM8nAJcnTS+FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2q8y2N24PfPCYBYGrJF2OIGt7Ai4WIppje/dy5lwwNfjH5jk
	KJTZ4jTmNYZF8PMlInibuCHPxQ5ZEneFrLG9buE1ysDXoe/M3d4k70Ol+oPkaUoqAVo9O8+9/b1
	Um0QMys+mI2Vu0ScAzgo4o2HWFQ==
X-Google-Smtp-Source: AGHT+IEAValjLvIQUTTrl0WGiv7qDA/VK+W0m1ZQUDRoDH/VSaq0CR37ZF/2z6Fxf5GRvTFbBupf/JJhqDdR5wa1WQ==
X-Received: from oabxc6.prod.google.com ([2002:a05:6870:ce06:b0:2e8:ed52:15c9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:7050:10b0:2ef:eddd:690d with SMTP id 586e51a60fabf-2efeddd6bf1mr119143fac.24.1750968354720;
 Thu, 26 Jun 2025 13:05:54 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:39 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-4-coltonlewis@google.com>
Subject: [PATCH v3 03/22] KVM: arm64: Define PMI{CNTR,FILTR}_EL0 as undef_access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Because KVM isn't fully prepared to support these yet even though the
host PMUv3 driver does, define them as undef_access for now.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..99fdbe174202 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3092,6 +3092,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
 	{ SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
 
+	{ SYS_DESC(SYS_PMICNTR_EL0), undef_access },
+	{ SYS_DESC(SYS_PMICFILTR_EL0), undef_access },
+
 	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
 	  .reg = PMCR_EL0, .get_user = get_pmcr, .set_user = set_pmcr },
 	{ PMU_SYS_REG(PMCNTENSET_EL0),
-- 
2.50.0.727.gbf7dc18ff4-goog


