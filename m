Return-Path: <linux-doc+bounces-32035-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860489E4453
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2024 20:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B5F2870C9
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2024 19:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9022066C8;
	Wed,  4 Dec 2024 19:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RLzC5YlO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E77202C24
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339665; cv=none; b=BtyDumwzPiiABjPTWXF0iwjDx0vgE/iHEzOfjmtXvS3lYJ1vNm7aGroy2hb+44YU0M5KOZ1/ZmDRe1vVIgrFgv0CK6x/EYlwkUHYu+qElpFnftDi2Jw4pIBfnlotYUnLTRkQkw93ac+Wi2yWbumP/MzUoTdjfixTjpunKpEzLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339665; c=relaxed/simple;
	bh=xFw8gMJXJ08WDMuWWWZTgPnAYLLdNgG37mOiDKQ6GfI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D+dq1PsvYWDuXjeUz4li8afmS6cWttBsV487svbEihRMkfEkPbAXcxXUjpoHk5s3PfONIYPtR1F9RSMXXVpbqsz72NR77Mg/6xM7S3zxZvJBOWMw6Oqk0y87pn8hc/WC1lgHn35SJWXg8+9RtffMnGShewH4893ugpr6wUE+YDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RLzC5YlO; arc=none smtp.client-ip=209.85.160.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-4667932b9acso2018621cf.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 11:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339662; x=1733944462; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Bh/8/p57GgUO0KFv6z2qw3B4ssWvPHnpaRRwgHkKo=;
        b=RLzC5YlOkHSg5BEp9VK3913OpLGrLK4OgYjfdvSzcOVUpnM47LjFNp4MyD4pSxJr28
         4klhyJ7clyEi2w8gqLffEOKz5UEREENNz3K1l8RWmfYDedVORsdpi5SVKlKP7Ax3mYuS
         zcD2oltS7NeXcEB+hH+ULoYe8G/AyaiDNJqt1SSAT0O36G+d+0Wc0Bx/n/Z29lcExIDI
         LVeKySYNhbFhL0e6ra9hxwatT95xCDId4+U/T8DGaHztYdXeijwdNk090H4mtF0zTPrC
         ohIfq6MXSpwiXUkBjzH2++5Y6Cqf3Ehb+2+9ITgOJoCjdjLrIdT+LpRZEvcMtbp9bBeQ
         ZOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339662; x=1733944462;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Bh/8/p57GgUO0KFv6z2qw3B4ssWvPHnpaRRwgHkKo=;
        b=TEmQw+bVJoqwvpi3cLC9lhgMp6YzzN154MDdfTzqooMcMK42dXpYVW52RMHgmRM/n7
         i033hETKFCz2/2nemnxTY3CpjbSPKjEnovRofZoK6izMywtR3JhweHk9KvIPirGPM+97
         2gRw4SRrlkC+Fu+W8sTLdL5hy/F6kvxQMUX0/hn1VbkNM0QwweZuZrJwQfJlMgJAocrW
         IwtDnbS3ujp9CFXQVc16MWzjYBUmSWjCtsSXnRU9DTaBooyPeymWPTyBHNkUAOXc2/1T
         i0jnqtQLeXsVtpAz7X5seXMDl9JZc9tNRFXKMptT1QSM+1Ws5VNNfjOL2k4NceVDBmF6
         h05Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDK9fqqcX1kB+pILaxE34vFD02lll5tPl9RNESZE9XXiKnNJaTTiT+mQYRVlrBZjD2yf5gAzmH4sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YysKe8E8TntifcAoz6vOnnqHiN0i1NmltIH+qE6h4zu2XgOIXL7
	KH0Gj0DrgSBvW54uCp5jJxQnS7UgduTd18GwqURAsi6i0+CIl3JN2JmA0zgUvAElxSibV3C53d2
	4Ffvb3r49nQragRt1Bw==
X-Google-Smtp-Source: AGHT+IFL6Yzt0JAsezCjVnC1Ege7Dcb8t0Na16LNTuDgarqYjisKQzOlRXRbl7knWaQbVhi5EaZ6me/AizxIjPXb
X-Received: from qtbcf26.prod.google.com ([2002:a05:622a:401a:b0:466:a2a5:c51f])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:7fc4:0:b0:466:7a01:372b with SMTP id d75a77b69052e-4670c0c1884mr95272281cf.30.1733339662158;
 Wed, 04 Dec 2024 11:14:22 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:42 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-8-jthoughton@google.com>
Subject: [PATCH v1 07/13] KVM: selftests: Fix vm_mem_region_set_flags docstring
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

`flags` is what region->region.flags gets set to.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 480e3a40d197..9603f99d3247 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1124,7 +1124,7 @@ memslot2region(struct kvm_vm *vm, uint32_t memslot)
  *
  * Input Args:
  *   vm - Virtual Machine
- *   flags - Starting guest physical address
+ *   flags - Flags for the memslot
  *
  * Output Args: None
  *
-- 
2.47.0.338.g60cca15819-goog


