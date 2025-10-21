Return-Path: <linux-doc+bounces-64060-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16779BF73AE
	for <lists+linux-doc@lfdr.de>; Tue, 21 Oct 2025 17:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2627719C21BA
	for <lists+linux-doc@lfdr.de>; Tue, 21 Oct 2025 15:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379CE34165C;
	Tue, 21 Oct 2025 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJMkyDlm"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DA2341651
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 15:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058850; cv=none; b=ZDdjyHA1edrCKU9un1DzDbksZBe7unJiuNov94HUaZRm0LN4GGyXmHU68131mMLzNZfFJ80PmElLqeq2zNi3BP8P/hARGTK9C6svgVHB4AzIzEE4B5BbgdK6cR85FxiAgkXubDGFxIiqKJWcHG0U+jYO/ptDHYCmicebTONgV4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058850; c=relaxed/simple;
	bh=OUfDv1UVoayG4u3Qm8KhKCzfykxkZrQ4CprPvtCNsMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dj09fVYQ84/WGgmPKI0aQmcpfRtaUd4JD+lNgEf9fKr2xkY1U/Fy5mS9a6tKGm+ejj69pqIGD+IDciRYdsZY6IWc7oGO1U/R6dJ+hruzNcCHWfDFKezaTZZPm+OfhdAiH1xXn9wVkWoRs/abK8aDKpy7FJsmLJdpESiybNjpfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJMkyDlm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36pQ3u8jy0FN5dn5JcBHYlI7xvHgf6+mb8fY5UQyalU=;
	b=eJMkyDlmsa8hrcXdJnBGf0UR031693Dx6x4NkwS+M1JA9mK5IVnLMU/TDd6dedYGpYsJZc
	B7A2nCt6K6+uKjvwodoCKfVEGxq2g2EDF0VMBUMqxlMQcoZPQ9gLOaiZ0LcLEVfAEasrRw
	xwxGSquTzH8ta7Lt6ww0IJTKbIK3QL8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-aXSO07JTMTGVxg32ayBozg-1; Tue, 21 Oct 2025 11:00:44 -0400
X-MC-Unique: aXSO07JTMTGVxg32ayBozg-1
X-Mimecast-MFC-AGG-ID: aXSO07JTMTGVxg32ayBozg_1761058843
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42705afbf19so2330874f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 08:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058843; x=1761663643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36pQ3u8jy0FN5dn5JcBHYlI7xvHgf6+mb8fY5UQyalU=;
        b=VCRisDro/3jNxjxitKlSY93xGLe1VVRYX6ZzoF1kVePeDQCEw9SPyD3RO2p989x5n5
         CTV6Ozz9s7oIbS2We3en8Tgd+hU7sTxZxnKzQOV6cyj+ygHo8yXHazkZN/MEjhWSHinh
         e59qLz3S0U8nJw7/bVFwlMhwAdtoA7USYfizHYa24tjEQRg49N/3iUdwapXA5Ev5lLDq
         7JJqE86qDQjUquXAb8K0zBIAmKceGcCBBmVE7D77k2qsH/w7eoKqyHeKVkQ5B4n1xID+
         MZbPZvpzuIDStBFP3n8fobYLxY0UxgHKwQginnlwFJU0vsjaN8MCzCZDrO/zAwoXpITI
         /RLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtrKEOxt0IEBD+6O9rpEXTA+yaIOwz/SQzVEHdY/8we/tRrpcH5orAhcsZYt6rn/tBJp9VdJB7yAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZDZI/Cfe0auArOLR/1MRiO9nqWlE99WJ8F+a7R3jVSJiPqZW
	gA//gZXLX1VBw0WMQH8tqjjUB2X+zh9zVAm9HtvH5djen9UuVga/GL989iUyn6G1dYPYAZ/u5VQ
	smhWh/qpib9RdwSUhTzMF5jgKMCVfZT4b9jHEb/fXUTROB0UEKd7VRX0w/XmI/w==
X-Gm-Gg: ASbGncttv35RqcBpLkLlm6zns27mMVsSK4Uu+LLbLMYhIHHk+xEo7jun7sKbJYugJYh
	FXA46H6P6SjQYDNI4IFKZbYxgjgTQN2foinAsUmKNPJwbOYcr64t8TGPzSJ/Lj9tRh9FHTTORrT
	nfGSXc+jcgXuw/bGPOA+1l8bynbeJPi7aS7jivbVRAZUR9Vm3JucoT+gbRH0sJ3mzKGVOjc5L0I
	e8w/OfBeibdqOUmqYv8Lzt3h84pP3mcrPV7Dmo7qUJVpxhoMaTBPro/7iIeDSfOXZ0bEEHFHCXG
	XLReTyrP5Hmgjz6Gu4/ivl/7oyd5AARrr/vv0yDrDAi7Od/rbhlrz5of+b8Rt0PjlXrNPJv2Jq6
	rkkE48E+S8ooxVPWDLKkGDAi0ljlyRSEDD9nmzaIwamvILf3DG+y+BfEIoOXG
X-Received: by 2002:a05:6000:2312:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-4285324c1ecmr15560f8f.6.1761058843383;
        Tue, 21 Oct 2025 08:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZSHalSV1qtXRSgl0VFWeqe9iy+sxBgka0ewlzc4+wG6jRvgfqUYrrl7qKB5xy+AtSOmms8A==
X-Received: by 2002:a05:6000:2312:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-4285324c1ecmr15477f8f.6.1761058842857;
        Tue, 21 Oct 2025 08:00:42 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3f5esm20480663f8f.20.2025.10.21.08.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:42 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 17/23] mm/balloon_compaction: remove "extern" from functions
Date: Tue, 21 Oct 2025 17:00:34 +0200
Message-ID: <20251021150040.498160-1-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding "extern" to functions is frowned-upon. Let's just get rid of it
for all functions here.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index eec8994056a44..7757e0e314fdb 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -59,14 +59,14 @@ struct balloon_dev_info {
 	bool adjust_managed_page_count;
 };
 
-extern struct page *balloon_page_alloc(void);
-extern void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
-				 struct page *page);
-extern struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info);
-extern size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
-				      struct list_head *pages);
-extern size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
-				     struct list_head *pages, size_t n_req_pages);
+struct page *balloon_page_alloc(void);
+void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
+		struct page *page);
+struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info);
+size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
+		struct list_head *pages);
+size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
+		struct list_head *pages, size_t n_req_pages);
 
 static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 {
-- 
2.51.0


