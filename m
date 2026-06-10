Return-Path: <linux-doc+bounces-91855-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V+8iBi57KWp2XgMAu9opvQ
	(envelope-from <linux-doc+bounces-91855-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 16:56:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE466A7AF
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 16:56:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p+ic8jv7;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91855-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91855-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A92431C2D4C
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 14:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38B431F98E;
	Wed, 10 Jun 2026 14:41:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE13D9674
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 14:41:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102498; cv=pass; b=SWf24tS6ycdjZfr109Iqrp1yQ6CoU0HLfGlScL0VF1leUF+cIyTuwGOn5WDXw5H6W7J5WUbrn8IbkfVrY4cnrO90Njc+r3m7NIQzbzF35bWst11yVWbfWJSuE0bFjWK7mhxX/qCb4OFfrvAFtz35HepVE6FI4JPbH4DbzsgquzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102498; c=relaxed/simple;
	bh=J3ECnoRaw03PN8SDn4t5pTOE7Fjc8A5WosNk33q0VdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVuZ5iovgqJkLETYxftADx+YTofMJxFt+WFJOSsKtUzis67oQVT/On9JRGfYILiPQ6WuKCZWXFWrdi74WNSF+DLuiBHLbeXWDti0IkOV2h4pH5YesII0S79/hHHLbpmB/QAY4lxZqRpaPPl6bdqhFerlIno2jPmBikkEt56JldY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+ic8jv7; arc=pass smtp.client-ip=209.85.128.179
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7e2cf9bf458so7247487b3.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 07:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102497; cv=none;
        d=google.com; s=arc-20240605;
        b=RJiHtPRnDrjESAJGyVYJhF7egUJNE6/nL151dPxkv7gheRSPB/n4abZbqd7bzaOP5F
         azCw07oP4F7gkW4EpPXgdX5BxmU+Pk9hsHzOStEhiMgG6vfkJRKvd6TZmJV+y9jrilBd
         6W+/t/Q9O4THxoVDW6TtW4kJW/9vntFkbOcRBehzIzMUfcEA44pnOCgjYaWSxbUeplJc
         qAW8B+MNFgZ1GGv50+5VuSgp5Pl2AcebL1RPKMvGtRtu2pey/NytHykqf+DDfVP+K0cf
         H6RtZrH9nxqELkqQldCM4aDKePg1i1xdUNXXhUqKY9r6sbcqzBJgf+2ON2tDuYpLgnru
         N1Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J3ECnoRaw03PN8SDn4t5pTOE7Fjc8A5WosNk33q0VdQ=;
        fh=oEviwjOANkIjtTHclH/CTasaU9xJRZiUd2m++HWWjMY=;
        b=BMaNnBd9oovrrz+M5px7JnCK5LrX2JoqXnZc41PbIzBVJChRgI6rDUhsTSP9lEnQkT
         3m6GNj+fNmvVLht7PV5722ATjNXG6B9RfL0sCHADkr94gIEP//bKCRvT7w+8ACq5NgF/
         yczwZEq7ZFiF9jBd/p/VvBvmLWywNkAp3nT4nJ2bcgd/3G5TKaEm1vPI88jjztSvbWJN
         aIF4M+qliBhs+XqJrnt3LZ7Ki3XMHMm1VvJYG4gFgn0jkO/QozwUNLzbw2kwJ+0r9VCs
         Xt3/URyGlB2ewxdEjM4FOdRwrOccZMXBukNdWb6i9ooZ7sW4xF4y8yXsdVtMoD9sTb/L
         yQKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102497; x=1781707297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J3ECnoRaw03PN8SDn4t5pTOE7Fjc8A5WosNk33q0VdQ=;
        b=p+ic8jv7JN9n9/M0kesTrWZhvQF78i+OxfF3RiyFV4i0DlCXKUzDrExujZHCpCYJgP
         hkwFNdv7N/mS5fx/Y0RiNyY9WKzfhu+PrUTNz14wqNoMCSMlZDtGACXTRcRHM8nex6re
         YXjSSfmGZyDDdp0AF+CIkIL2iRZqzcC/NAch6qJMLUq0SLCWl0rsrDQ2tYdehkKDREAK
         KAcMvRwNzt/vaC8A+mekA8s294kfQTU+r99wI2YLuX5CxUqtPJPHpiUa6dn/yE47CJxQ
         KoDM7WnygC8vygzNKy7jVfB9PE3nVkv1zErb0tvEh71ITzw6IFkTFwyRnc2Pjql/DK/X
         5y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102497; x=1781707297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3ECnoRaw03PN8SDn4t5pTOE7Fjc8A5WosNk33q0VdQ=;
        b=A3WT8MXX0EAcvOWQMcQqhx3P5CtleliO97I85oSN3BX0XmUdu7T95d+4kfGkOYFn/i
         SDURvRWaKA2HDG1pt3oyBQW9VyFJiFPf7sMjuwO3VS3HmFoAMK9xjkvtYx02OSTJ8c5Q
         BU9JGqaLYFt1fg23ZopuE2SDL4Xa4SPp6HFQzEVLCmdp+7L1vYDe+wuh9YV5dnJEGgen
         pTnYH3Vw6u7JwzDDiQJYkiQiiGqbVuaLtZqji7lTAV5WqsZrSQgRGYYmFKB0tSKuFG9v
         rGCrhJKT0ZfOI4Q5p1oMnwp2PedaoqrFPMf6oS+cO/ex9CPweJR1dhy/5aNuy1AwVe+n
         AcOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Aj8eYfuRI3qRCSVu6Th7eMrbEuCp4NBpU5ljKoED9ZH/0hDXzgaraCwCJPloIF2NKgfbUukSoIas=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpp5Yhjo09QQBgV6Fm+fdBn1h8ybe7bcDztLaf0JQ8QHeARy4T
	OVvEvUD7Uj2aMEKnowneD1c0AMEXdqe7vSXe6WGHPfamzyCFHmLYTtRwA/+tAkPUaDe1wLVSdiF
	oPLb9nXW1ODhwpjrqKG8qeTeoiPZl1ko=
X-Gm-Gg: Acq92OHafkDyK7cyYFGhkf9Hd5Ova7E/2t+qD/0xvchptC1tBOaVbvGFBSftHiLcslu
	bvtDVp7k3wWQPy/SBwSaz5h5VzMYcPDSGuCCh1uBhOt1d2l/2ipjhgej742p3BJFAmyJynFX/4t
	g1kyGrV5fUKE5v19qWPv82ujx/wqg5NWRXVA+v3xpA1fVoAGRYEoOWJmLJHonD2JjtmTy9Dc53P
	btcRRkjoAS0OI3HuCQfkuJFNh2fn7sLfyHbr30LBYzxhl9bO8qWdzcj8Jp9r0Ei2DtZAkfc3/tj
	m121/B8hWNZvI7iHTyTm/ibOy6qoc9588vX6XSF8XTln2uTpWz2lMQZHb80o1P6RzOYhd6I5gxk
	5Kgy03PA=
X-Received: by 2002:a05:690c:c510:b0:7ba:d784:8b59 with SMTP id
 00721157ae682-7f2b24517e2mr46666727b3.7.1781102496564; Wed, 10 Jun 2026
 07:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610053951.553739-1-doehyunbaek@gmail.com> <20260610140217.65110-1-sj@kernel.org>
In-Reply-To: <20260610140217.65110-1-sj@kernel.org>
From: Doehyun Baek <doehyunbaek@gmail.com>
Date: Wed, 10 Jun 2026 16:41:00 +0200
X-Gm-Features: AVVi8CfkGlQtzkdy7N4hrt8LYt2S_-OHJvl9Twtw0u9LuNxesLYSD1U1AF8K38Y
Message-ID: <CAN-j9Upu0grcp=AL42m8b41GCnU3+CUYJbj9=dg1esUAJ0hguA@mail.gmail.com>
Subject: Re: [PATCH v5] Docs/{admin-guide,mm}/damon: fix DAMON documentation details
To: SeongJae Park <sj@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sj@kernel.org,m:dzm91@hust.edu.cn,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91855-lists,linux-doc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[doehyunbaek@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doehyunbaek@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ABE466A7AF

> Let me know if you think this is really urgent or I'm missing something, though.

Thanks for reviewing and applying it to damon/next.

It is not urgent from my side. I needed the English documentation fix as
a base for the Chinese translation patches.

Dongliang, would it be okay for me to send the Chinese translation
patches based on damon/next, or should I wait until the English fix is
picked up by mm.git or mainline?

Thanks,
Doehyun

