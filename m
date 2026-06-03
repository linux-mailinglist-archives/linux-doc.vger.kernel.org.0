Return-Path: <linux-doc+bounces-90735-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jp6DDxcqIGo6yAAAu9opvQ
	(envelope-from <linux-doc+bounces-90735-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 15:20:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A15637FAA
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 15:20:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RH+3YOuo;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90735-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-90735-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36948308B821
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 13:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87931481233;
	Wed,  3 Jun 2026 13:05:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4CC480DCE
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 13:05:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491946; cv=none; b=RulyNmqwJdE+2lIV78ImX+XPKgl0rrwfi0Qu67Rqjdzv2lO2/N8lT4oVHTu/dCcACCgMFRluxRzuFLJin4zqH1LAF8e/ArqWkDHSvTV3tN23AMZ+v8TGszeyld1XapSYIndW8suNUikNcOf6nviZIdnz1nHhPgb+2pLLveInrSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491946; c=relaxed/simple;
	bh=5VLnZhSIf0jXUgELog3B8KWjOVsjpryu1D4jbtsrY2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hd0XqGyxMSoPZxhKz9QNOqxehIvz9MRboT8o2QAaohgodgfxINywUx5LrZGKL/eKSTzI6Xx4ZhPBjKbYxXvaJYuT+zTc5DXG7mWQRqliQvs/qa9M5xbMbQhfxudYLC98+l27KbT+n1UkOTykLFJyEtWkIweLoPe4iV13FQUrbI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RH+3YOuo; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8424b00710aso2189372b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780491944; x=1781096744; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUNz2ByJ1uR0lUfiaY2wF4eyBaRncro6lIUctBUODUo=;
        b=RH+3YOuoRdVV8cqzG3NAp/tCoYd+gqvoqcVr2HapJ1WMbYiWMW/pJNftkZ0B/Stc2+
         8gqaWnMQzEJeMqm3CtVn3dO8hzIK6KNH2lNY2aC8t/cSrkYoVgIi/t5IRcYJAiORzMNP
         SnkZl0HJtJwyKdT98GpukTTryi5nXfmrEvUgLmNFIHVnZcG0qBJ0TdO180uaa9cops4j
         9KtGG1+BMk1e/mJBv2QNT3GT9Wz1HOnOtYbSCUJFQWJNrmRlHSh/YtEPbgh5/RxRUxW8
         DCmla2R7O/acsh6rZVqq3bilLWAQ5T5bUVyF2Ay/in0H/Y931gj+2ZBq+Ass80xlFEgc
         Inmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491944; x=1781096744;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUNz2ByJ1uR0lUfiaY2wF4eyBaRncro6lIUctBUODUo=;
        b=PPnpU/sD+27guplNv3R4jympruklACwaPIfgyn8b+NlNpq9Bf0WL4bivKYQq5UnsJW
         jrva0UCWiQVWhVe4+4O0T4mOU+UwhwB6RsUVVhHUQqeYaCB/wKCl8xb9z9u5ilKYJOBK
         spnPzAnYmild3De2CBrYcUsdMeExFGlFo6p9T0sXS9NXtOIbZCfv3Gyh3ifDcGcawbmQ
         kGmK8D+qPL915gRWVUFAYPNuYZvPPtF/iULE+O4vJ5S6vOSAfqexSccSY9R/LHxZpxfo
         5IsZiuWSgngOA7nLec9moKzsJK6B+O+JUAjD5W3LUcU/a/Mq6+bErL+UEBKERE8niGO7
         go5w==
X-Forwarded-Encrypted: i=1; AFNElJ/BIOtAW68wrmQ93OQJI5i+NXKdaWOU8MXfYXjCrS5vNNfUc2FGL4EyB5WCSOQqToFBcYR9J3+HA74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzigyyJnntp3fJ6FaEAiEIgTuGaOuwE4w4OfaZDd0GjXRHgqKVW
	7fcWCFLrMptENPDIGZLnm4KlriaA9SVK6ZUzkbV9BYslV8R+YogoS/Qt
X-Gm-Gg: Acq92OHbjamE5lmZFz9LuG7VMBI5ceOZIB4q4rKM4ox8Oa+g631YGL+QFnYGrJL36vY
	pQCV8o1hI3wYxyPkbLkadiyTBVOa6cyglLGPQGQG5dBdOgyOC+gZt493oRmJeMKuz9GuEHmg3iv
	6BSZ9cZegviJizR54v54eoe2mSR+Tpyh+3Fqb+WgtVSEYpCG91+AhWMxmGMT64jo1aToIXsZiml
	+9Qs3X/UJqyLEhuEHLcLeY3hTU0JL38m2DvxGJlcYQosd/zad2iu87ZH7JiTgBb2j08HNThSrFf
	g8XFpn+6RCCgZLSUosRS/hCfsAB9ojRDIKFZr4gO7Al0740f7SjQeAVN5Lm8idbwcNXjQ1zwYOf
	7UFtMTvjUZ4jfL8wa8chlEZfuofnx88GS7dQHcG5WjAFU9WMngvUnWG/AgpIYP+opaCJpkuZTPs
	MiXi2uGmq5Ixa0f9dYHNQ/WkCn78RqjJlI1v6RiQvyiy0GBGTZe4yv/cm7pZ7edTXZxyFDkvij9
	lJtf7FQIDE=
X-Received: by 2002:a05:6a00:1d9e:b0:838:a46:ce99 with SMTP id d2e1a72fcca58-84284fada0emr3028039b3a.48.1780491944310;
        Wed, 03 Jun 2026 06:05:44 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821d0sm3018661b3a.28.2026.06.03.06.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:05:43 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH v4 0/3] mm: clean up folio LRU and swap declarations
Date: Wed, 03 Jun 2026 21:05:31 +0800
Message-Id: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsmIGoC/5WNTQ7CIBgFr9Kw9jMUSn9ceQ/jAihtSWghYFHT9
 O7SutClLuclb2ZBQXmtAjplC/Iq6qDtlKA4ZEgOfOoV6DYxIpiUmNEc5ADhzh28f+DMHKCzRls
 wfgZpFJ9mB21T1bmsKSWtRMnlvOr0Y+9crokHHW7WP/dsJNv6byESwJCLhhdcEsZEce5Hrs1R2
 hFthUg/1hKTX600WZkQgpVVV8um+bau6/oC09MN+TABAAA=
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1780491936; l=3985;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=5VLnZhSIf0jXUgELog3B8KWjOVsjpryu1D4jbtsrY2U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCSpdIDNmbNJM5EUpVtFVV9jlxnqM6P2hi0lMTlOMnz2cxEysphPYLNuuvG+Dt4a5TzXOxCrD0x
 xN4GjzBx2FAw=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:hannes@cmpxchg.org,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:wujianyue000@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90735-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,tencent.com,huaweicloud.com,gmail.com,redhat.com,lge.com,linux.dev,google.com,cmpxchg.org,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36A15637FAA

The previous version moved the folio LRU helpers out of mm/swap.c in
one step. Based on review feedback from Johannes, Baoquan and Barry,
split the cleanup into smaller steps:

  - move the page-cluster sysctl next to swap readahead in mm/swap_state.c
  - rename mm/swap.c to mm/folio_lru.c after the swap-specific bits move out
  - move MM-internal reclaim declarations out of include/linux/swap.h

After this series, swap cache and swap-in readahead stay in mm/swap_state.c,
folio LRU helpers live in mm/folio_lru.c, and MM-internal reclaim/workingset
declarations move from include/linux/swap.h to mm/internal.h (public LRU
helpers used outside mm/ remain in swap.h).

The first patch handles the swap-specific page-cluster state before the
file rename, so the rename commit only carries folio LRU code. The last
patch keeps the LRU helpers used outside mm/ in include/linux/swap.h and
moves the internal reclaim/workingset declarations to mm/internal.h.

This series is based on Christoph Hellwig's swap_ops series, which
moves swap I/O dispatch behind swap_ops and leaves mm/swap.c with less
swap-specific state. That makes the folio LRU cleanup more natural to
split out on top.

  https://lore.kernel.org/r/20260528124559.2566481-1-hch@lst.de

To: Andrew Morton <akpm@linux-foundation.org>
To: Chris Li <chrisl@kernel.org>
To: Kairui Song <kasong@tencent.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
To: Nhat Pham <nphamcs@gmail.com>
To: Baoquan He <bhe@redhat.com>
To: Barry Song <baohua@kernel.org>
To: Youngjun Park <youngjun.park@lge.com>
To: Qi Zheng <qi.zheng@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
To: Axel Rasmussen <axelrasmussen@google.com>
To: Yuanchu Xie <yuanchu@google.com>
To: Wei Xu <weixugc@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>
To: David Hildenbrand <david@kernel.org>
To: Michal Hocko <mhocko@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
To: Liam R. Howlett <liam@infradead.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
To: Michal Hocko <mhocko@suse.com>
To: Hugh Dickins <hughd@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Changes in v4:
- Address Baoquan He's review on v3: align patch 2 subject with
  rename-only scope; fix vm.rst sysctl documentation; refresh file
  header comments in mm/folio_lru.c and swap.h declaration comments.
- Expand patch 1 commit message on CONFIG_SWAP=n vm.page-cluster
  registration (also on CONFIG_SWAP=n kernels).
- Link to v3: https://lore.kernel.org/all/20260602-ch-swap-series-plus-folio-lru-cleanup-v3-0-5bbb567f8c99@gmail.com

---
Jianyue Wu (3):
      mm/swap: colocate page-cluster sysctl with swap readahead
      mm: rename swap.c to folio_lru.c
      mm: move reclaim-internal declarations out of swap.h

 Documentation/admin-guide/sysctl/vm.rst |  3 --
 Documentation/core-api/mm-api.rst       |  2 +-
 MAINTAINERS                             |  3 +-
 include/linux/swap.h                    | 75 +++------------------------------
 mm/Makefile                             |  2 +-
 mm/{swap.c => folio_lru.c}              | 46 ++------------------
 mm/internal.h                           | 68 ++++++++++++++++++++++++++++++
 mm/memfd.c                              |  1 +
 mm/swap.h                               |  8 +++-
 mm/swap_state.c                         | 37 ++++++++++++++++
 mm/vmscan.c                             |  2 +-
 11 files changed, 126 insertions(+), 121 deletions(-)
---
base-commit: d7be408821acadd7d713d1da16a6742886799114
change-id: 20260531-ch-swap-series-plus-folio-lru-cleanup-d9781c8332dc

Best regards,
-- 
Jianyue Wu <wujianyue000@gmail.com>


