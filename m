Return-Path: <linux-doc+bounces-96775-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +RhHKb9SVmqF3QAAu9opvQ
	(envelope-from <linux-doc+bounces-96775-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:16:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A15DC7564EF
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:16:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=K4t2rlcF;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96775-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96775-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBB4F300B503
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D2A4963B7;
	Tue, 14 Jul 2026 15:15:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B1495525
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:15:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042117; cv=none; b=RflnHcdNJYqCQ4N6mER098YjODUvBDEfAR/p8DqMuU5nYOR4B5hFlEbOZkIZRXmIbeFRaiLLgot+F/icpf4G5nzCx5X4Rh6CqIlkw+8MHqx94sXdbzUkiYo99sMx6I1DUXACNcEcMGLgL+AHIl4Jzy7yYdNFcP7FD9Fnr0pG/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042117; c=relaxed/simple;
	bh=YVc+pKa6Xq4074+to6tFg828NsW4PA06kR2BHhEiYWA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GKhKUY5mI5PJ8zme4wxXYpHwRuZrL+CjKFqVkrgA/nCsplt7WRwZ7WXcGxXO/xXcb2kT/ANPuo55UEGU8xFKUTkD7CTht6+U4X40A59Q6vkwINbPJkuGu1/eDJvkmPTSberBjuAP/xYcpKpOthsIbwOQrFUY4c+AGMhJJr5KgsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K4t2rlcF; arc=none smtp.client-ip=209.85.210.201
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-848860def2cso4614398b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042114; x=1784646914; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsilKFLygw8IS3OsjN731JV3UeNVYFWUky8KZoNrr2s=;
        b=K4t2rlcF3KYL3tUet10Vhgi5pW8myoazkA0EXJwCQmfspyzYTzKSmHJzDNfaeGroes
         tCbeqGVNsJ4dd2Nuqx1ApzTwwtw6PBDgkeUJHHCPpOrBA16NrC62Bb5R+lz7CWci9J9d
         Q2i0o5rpsCpIIESANYDmqbPiDeVjtUrFvNBgg53wmeiXgvBh+F3EJ2pYzi/o99rUxsTO
         CbMjHdpR/rpEf7P16STgHd+xuHWlJeLL8vmStl5ViYP0Jcg4bP6sNvqE15/eZFDr/Ip4
         NDs41oKa1UOYLzn/JRWcSyf5z6WrtPHzPiFIxdb+LZc0N0pkXt8R6wdR8h5IKMWOhP0X
         nkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042114; x=1784646914;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsilKFLygw8IS3OsjN731JV3UeNVYFWUky8KZoNrr2s=;
        b=CULzvN/5/8rpMn56ZxJHAg82m1da/VuecHwD4G1Vh1QnHUyjsf3lp9dSW5O6pIrvK+
         7j24d2VMSZFv3ucEkFel/WTAWcDYaXUou4NKNlUpFyd2y38rs8V2utXi/Y4/7v/DgYmZ
         EKVgDgDQK5iywUQpZy6oThJe+6VK3Vsqmt85upkJrgF/5R9We1aXU3datwClafK6vCM0
         9tTsxRxoXpDTCXhOdKV8yj44SNIrl83xQaJiiAfAwC8s0ZtuY1vhc79wEjbXME/C5Zux
         /HhghPyco/RhkZ3UDw8sAA2aqu3SUt6LM3d9AakdD+kqNrhQjlhBFnkRIgvJuPJc56zt
         7Ajg==
X-Forwarded-Encrypted: i=1; AHgh+Rrw/yu7JR+V7EhYdzVZKI8Jz2dZc1wtcQD214+67sv7aLXV4VcSLdVkMPKIHp+c6EQB/zaGzJf2nWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPjaTGn0IEeIxx7w6okJZ3QqmvkHtS2kvYMF60gZq2jLIL4UsU
	nCNyYTJ2Pul/BouLPUPAE7NO0ut2hg6tiFk6+1YMZR88bfy525WIOOrQ7ThTT0ZdfZOrn7j6Xnx
	ZDFCED7c3FQ==
X-Received: from pfff9.prod.google.com ([2002:a05:6a00:bd09:b0:848:487e:d23c])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:992:b0:848:65f3:23c1
 with SMTP id d2e1a72fcca58-848897d7661mr12194779b3a.69.1784042113533; Tue, 14
 Jul 2026 08:15:13 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:49 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-5-vipinsh@google.com>
Subject: [PATCH v5 04/20] liveupdate: Export symbols needed by modules
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vipinsh@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96775-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:ajayachandra@nvidia.com,m:alex@shazbot.org,m:amastro@fb.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:bhelgaas@google.com,m:chrisl@kernel.org,m:christian.koenig@amd.com,m:corbet@lwn.net,m:dmatlack@google.com,m:graf@amazon.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:jgg@ziepe.ca,m:jrhilke@google.com,m:julianr@linux.ibm.com,m:kees@kernel.org,m:kevin.tian@intel.com,m:leon@kernel.org,m:leonro@nvidia.com,m:lukas@wunner.de,m:mattev@meta.com,m:michal.winiarski@intel.com,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:rananta@google.com,m:rientjes@google.com,m:rodrigo.vivi@intel.com,m:rppt@kernel.org,m:saeedm@nvidia.com,m:schnelle@linux.ibm.com,m:skhan@linuxfoundation.org,m:skhawaja@google.com,m:vipinsh@google.com,m:vivek.kasireddy@intel.com,m:witu@nv
 idia.com,m:yanjun.zhu@linux.dev,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A15DC7564EF

Export liveupdate_register_file_handler() and
liveupdate_unregister_file_handler(). All of these will be used by
vfio-pci in a subsequent commit, which can be built as a module.

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 kernel/liveupdate/luo_file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index c39f96961a85..dd4e26ac34f0 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -909,6 +909,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
 	up_write(&luo_register_rwlock);
 	return err;
 }
+EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
 
 /**
  * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
@@ -926,3 +927,4 @@ void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 	luo_flb_unregister_all(fh);
 	list_del(&ACCESS_PRIVATE(fh, list));
 }
+EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
-- 
2.55.0.795.g602f6c329a-goog


