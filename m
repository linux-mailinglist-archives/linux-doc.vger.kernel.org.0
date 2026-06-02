Return-Path: <linux-doc+bounces-90569-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jl/VGytXH2oWkwAAu9opvQ
	(envelope-from <linux-doc+bounces-90569-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 00:20:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11278632630
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 00:20:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bU2FwIqt;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90569-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90569-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 336EB300D686
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 22:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEF23B5E07;
	Tue,  2 Jun 2026 22:18:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD4391831
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 22:18:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438733; cv=none; b=LWzzhO9T4BKOI75Q5tbuGFjke20xv+YbCj51k//9nPhJvQAC7x6vwXRP0xpK1/xBs52W9zZJ/rWWn2tcsJ+9gvbNlIS1ndIGBH+N7sFCmBq4hMIyI1j7jYu1SHea3K+bG3IoGn056tKgc/nBWrU8AmDtJFxkKiqUX3q1EFcdqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438733; c=relaxed/simple;
	bh=mOj/mm+e8bp2/YJzCq6+9P0uMrb6LHZnBSavOSIt+Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plGUN7gp6cXXPtEnh6X54C2j7QLNaT6WuiQdSyFajetyu7pyp+Rud9k4HDkFeqcZCr+7b8/YT/jFx6RNOUVG/jh+5NbN4zAem84nseHgZpHXsLe3Z+Rs+OxIYRzZ/5q266+o3w5gu1/DOwgL87u0VkocGriedvleIKf4dPcaZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU2FwIqt; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490a7629380so30402205e9.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 15:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780438731; x=1781043531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cw0K4qIf6+fPTBj4/hLwQ9yPr+Jm8wfwQ5XwEakJxQ=;
        b=bU2FwIqtI/ek7x6UMBn11WtrKx8FlTReBKhq5plCr1m3k/uobjxpoIlp7zMVMnTZBl
         3thz7aX1ott5Fs5kVnV4SS4bd17PzNtd1MsTx055upcCO443IjiC7yXfbhxK82jAhcHY
         3hAEDtli9C6Q/a+KOLuMuO0umM6ipNHKRDFLfxNUXfwlilC5eP6K6Tnyj5OvOMkj8fhX
         igu9ETyJIFH8+xggG7gD2NH/MaTM0oznAvY8qJ6fh9iN/5427lHgQLPmMkOCj0o2PUgA
         fC5Fg0mroCEwMR7zswX28q7RX2Ihu546eA03jRF4Z22hYRGjxu131dcXzN01P2SwicDD
         hSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438731; x=1781043531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3cw0K4qIf6+fPTBj4/hLwQ9yPr+Jm8wfwQ5XwEakJxQ=;
        b=hz67qV4BZB5mo21xLwxm7SaUGyM6SAXuXPQwrbJ4f4Qs22OdDsvSkk0M+AU6UAvQLq
         ZperRbxTo+Em4CkNoJwERCH0b7rMAqXrV7Pb6eOF1cAON3PFrGhsghDkHEypmHqHkQjY
         0pwZ8VvnoE7MOH+bvMNlNYGi4LNI8kuRCtTWLCRhKK6ZIUYoRJxqb9JuXtZNRGlFjB6b
         nZM6TQs+SfEknxAvQklaF0HiReUpA6UyaSJrorgKK1+W9DxvuXCHZFm0kb6QsWWAQxAf
         t5ZGOFw0roSdmY5G0u9qskUg+piff+8eH6mKn/EpDJuiA12M8usGAfr7wrsT4/JDDh7u
         BwzA==
X-Forwarded-Encrypted: i=1; AFNElJ+Cg7/YG/hGE7Ltr3krOgrmpGy9X9Pe2JjHe0YzwYTt0K+dWnpZJnucDLQDsW6JjbyhcFDBTcJlGqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6zb0IZeBid9MqPQ3gpT6yHmzqu8Jh5sce78SbQlfMirMu1Y/w
	weVWkXcaOFf9cmJH1wp+/nGxz2K7RxI/EqU8qbFzvb6gr+pnC6dgh8i8
X-Gm-Gg: Acq92OEU14PyAUCtQnrwC4vy6W15wdcojWhyl/N5QqMzeODMQIFu+SVSl4buhoEzcRD
	ll5nAOmgXtAniwLFxRdfUcKzrBJ7d1UrT890qFdGPUBrSyB+ekzzRL0Nnh5d2nxcEDs5D2k6J0x
	hiKle3MGXwbbpEZa2QZNrwppuSMkRFvbHqlekUiVdLkQLrR4iQ5SF8U3FsVF5C1TAYO2+fDBydH
	2MnXZM+LZSTMsECwPJsOw4WEgAoenkUK8CfhuqK8qY5M+Rh8umhrLaBqS7OodLKSIcRhWLLDx0O
	basp5RID3HGO3vrsfsriPpiStwa8yLbHJCUjJZckSKZVI9rWysOjFpRkoXW3PjMbFMoXvn7ChOK
	XjPat+QmGcfcd2xwYaw7IqwzV4SQgw2/wAunpX/FXUddT0Xtk2QggJsNL8odqKQv7BlsqZiKOBH
	NJUitey+1R8e9aR8Y3FBy5N10lV8KgUgBW6QF7SA+X
X-Received: by 2002:a05:600c:4fc8:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-490b5e8cd0cmr10087195e9.11.1780438730762;
        Tue, 02 Jun 2026 15:18:50 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2dcae2sm2882120f8f.6.2026.06.02.15.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:18:50 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: kas@kernel.org
Cc: Liam.Howlett@oracle.com,
	aarcange@redhat.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@kernel.org,
	jthoughton@google.com,
	kernel-team@meta.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	pbonzini@redhat.com,
	peterx@redhat.com,
	rppt@kernel.org,
	seanjc@google.com,
	sj@kernel.org,
	skhan@linuxfoundation.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com
Subject: Re: [PATCH v6 14/15] selftests/mm: add userfaultfd RWP tests
Date: Wed,  3 Jun 2026 01:18:31 +0300
Message-ID: <20260602221831.77366-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529172716.357179-15-kas@kernel.org>
References: <20260529172716.357179-15-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[safinaskar@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-90569-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kas@kernel.org,m:Liam.Howlett@oracle.com,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:david@kernel.org,m:jthoughton@google.com,m:kernel-team@meta.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:ljs@kernel.org,m:pbonzini@redhat.com,m:peterx@redhat.com,m:rppt@kernel.org,m:seanjc@google.com,m:sj@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:usama.arif@linux.dev,m:vbabka@kernel.org,m:ziy@nvidia.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11278632630

"Kiryl Shutsemau (Meta)" <kas@kernel.org>:
> +/*
> + * Test that GUP resolves through protnone PTEs (async mode).
> + * vmsplice() into a pipe pins user pages via get_user_pages_fast() --
> + * unlike write(), which goes through copy_from_user() and ordinary
> + * hardware page faults -- so it exercises gup_can_follow_protnone() on
> + * the RW-protected PTE. In async mode the kernel auto-restores
> + * permissions and GUP returns the page.
> + */

Note that I recently submitted a patch, which makes vmsplice equivalent to
preadv2/pwritev2, and it was accepted to next.

For now it is just an experiment, it is possible it will be reverted.

https://lore.kernel.org/all/20260601-aufweichen-dissens-ausrechnen-0d9b84728113@brauner/

-- 
Askar Safin

