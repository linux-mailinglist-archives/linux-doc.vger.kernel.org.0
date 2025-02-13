Return-Path: <linux-doc+bounces-38049-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D550FA35192
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 23:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C88188FD65
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 22:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9EC281352;
	Thu, 13 Feb 2025 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sv1/ykMK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f74.google.com (mail-oa1-f74.google.com [209.85.160.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D66280A4E
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 22:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486852; cv=none; b=q6AtnokTtaKlzmStrH1t/lcHNeZeO8BKgbuwbVcPfxfHU+7/9I/P8F0axvAgw1odvWC1xdvlLwCakAMaJDRKX79Aq94D1LiZDC4uTl5xSGK89ISiYKoG7hSKqZsv5XmX1ONYblkgwqOrPkDx4UiSRGMfGcUZbUYUVcQJAhdfVzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486852; c=relaxed/simple;
	bh=5F18Oz1NfRhSsjQbCve5rPYuqz6M7KrBBHSkuVvdo5o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p+67uuc5YNy4NL5QXWcX+rH5KVSlC8nK6ZjhRM1Cf+5im8X2r2jhVntMRc6nb4Wc+Vku2YDxlQbAZ44PYMP3vOAIE3I8PMttdHEfCkdwCbENN1VB/uhOJntl6NROBo+rZ46LizgOLFkwinELMMbNaBujC+22zi1CVEAhN6N9IzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sv1/ykMK; arc=none smtp.client-ip=209.85.160.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-oa1-f74.google.com with SMTP id 586e51a60fabf-2b8fdf98b0eso2478515fac.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 14:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739486850; x=1740091650; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXllq5kyB/DC+XX0EOcvwmmu4CtVKAeaHuoDmEpYjhg=;
        b=sv1/ykMKkL9y3ME0ICgFpk7WlBu+Zf8bi7kmHqgkbjMUjOeTUcbsWGsH1jt1kOEmyi
         ngXVp2vv3xqYHRMeDpTh/RE6u6RjiiuHweVq19fAKSiX9BZd0Jm5fZf7ueBdW6dTzSXs
         LASCIBdbnTaFF/MACIrrbnpY4NGBDa51pm1amfAiMKB/K5hLPJlDlNZtYhT4EBr6kf8B
         m5Xp1Z5+x/9uhfkPu9K5e4SXlsMb3n3MUutXJTWLguF7om5zB9LNtCfqXBchPuvYIyaP
         pqEfvywldqTgChyf+t7ieWz7wo0Yst/W5fKltImhJkN26BqvJCiSmVazM5QiwSG0YBcl
         R/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739486850; x=1740091650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXllq5kyB/DC+XX0EOcvwmmu4CtVKAeaHuoDmEpYjhg=;
        b=geSi2pj/aCJwtKhN4yy8PYFAef7KuzYzIRPlPY054njuDuh1rUqbKAET80FCutYPgE
         D08GPjv/bBAF+dCveai85tNE95pVDu7ANPx7bRJsVRqTyGW5DaC+aRNe6LkTtqLs4OTq
         XYLS0QIFP4Hh/huVix9sqwXiRUR0PLKCbksX7QtdwPPjJTI2qN70xGmnHD2iWHWCvWQg
         +BaZfLJSNEpcaFoQ0hbJ6jkWY2fQ7c5ek2oNkYsmqFY6OOUElQGBbl+ZGqOEwzg69X0e
         HEV0xxPvZk+UUctATULyTyDkYdi12AZHpJYQn26dOdfopuS1GWKwBxnmRuxXOTNAWMDf
         JdbA==
X-Forwarded-Encrypted: i=1; AJvYcCW3yZd1t/xvvC5hZl9zWPYgjkPZF8HranMD++JS7GLHavIZVTDvrmU4zKkrcsuloY2upek4iNZ/vX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7qbxbrsIPwQepiuV++qaCPLNWYMki+YGNOqQYFWNdIpQQxjDG
	CPxVU+AqE7TTCPdShD2GuPxOKL5j6hdN+GsJjqlpTqQMz08MJMiSno4AcwJhTIWjwZAm4Fo/iuk
	kWw==
X-Google-Smtp-Source: AGHT+IE3Y43bKeMlQ9EjFiiS4JaeOx4TU+qb97Ij8D1UDPSI8dMXOEq3dWAIQbnurpdiuJXU+uwYfxTupKQ=
X-Received: from oacmp6.prod.google.com ([2002:a05:6871:3286:b0:2b8:49d8:2c77])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:2107:b0:2b8:306f:c5ad
 with SMTP id 586e51a60fabf-2b8d65155a8mr5274258fac.13.1739486850086; Thu, 13
 Feb 2025 14:47:30 -0800 (PST)
Date: Thu, 13 Feb 2025 14:46:52 -0800
In-Reply-To: <20250213224655.1680278-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250213224655.1680278-1-surenb@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213224655.1680278-16-surenb@google.com>
Subject: [PATCH v10 15/18] mm: remove extra vma_numab_state_init() call
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vma_init() already memset's the whole vm_area_struct to 0, so there is
no need to an additional vma_numab_state_init().

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
Changes since v9 [1]:
- Add Reviewed-by, per Lorenzo Stoakes

[1] https://lore.kernel.org/all/20250111042604.3230628-15-surenb@google.com/

 include/linux/mm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 11a042c27aee..327cf5944569 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -956,7 +956,6 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma_numab_state_init(vma);
 	vma_lock_init(vma, false);
 }
 
-- 
2.48.1.601.g30ceb7b040-goog


