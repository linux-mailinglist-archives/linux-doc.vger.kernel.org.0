Return-Path: <linux-doc+bounces-92597-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0BdKLZ00MmoBwwUAu9opvQ
	(envelope-from <linux-doc+bounces-92597-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 07:46:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 285FC696A87
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 07:46:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LbPwuP9l;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92597-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92597-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 384B13040D94
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 05:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6003839A056;
	Wed, 17 Jun 2026 05:45:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF3398911
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 05:44:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781675100; cv=pass; b=ThXnoM+CqIRN0MKLbCrHayP/o+1sfUvj4Blg1zFCiExu/A1+jGRKfKzuYaqliT1/AdooeKTuE2AZG6z6BWTVYiHXDhmzfqSLmjYFkql7HnwINLH5T3H5ii1umizxqXhrfSY7founRMuSWjZ2BSDYR7TbTVyAKJ0eoal4AiJWnhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781675100; c=relaxed/simple;
	bh=lKRmpKmonuyhtIYX9JXaoktO3MKvyjTBa6sH4cggBwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1mumN9oouBOQ67jFfjHmSonfUB/wOXY/zdcV18qxTt7OPWFuyo84HL+QXyDgtqkeAq1ayOSqwMrIF7O0++mBgqrBBYnfdmbMaDKPqqviw4mBSRzHG18cCfpF6GwZ0mqsY/4WF6zqSuF5E67jbk2GNHu4vEb0+4nlOZZRT0uyg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbPwuP9l; arc=pass smtp.client-ip=209.85.210.49
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e709dd1ab2so2221754a34.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 22:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781675098; cv=none;
        d=google.com; s=arc-20240605;
        b=lx3NlZfL3ifJ44KF9J2Cyv/B4BX+5bne2m5G35r+NfCbMHyu8zIGMy21C4hf6rk7FH
         P11X/CxnhuLGK7Ui3tMXiOiWmPgjDgoEm3VZ2IjI5sPb8MMK+aMpPdLidxqDasgxctiV
         dsEOLi8tqXewbRqQ64uACn1LjCa6FFlGhH+OwPtzD+VXSF7np90jVmcpFJ5BcbOGMBd+
         k1bTRvwNAMKcCFwRyeEMokoMiQG3BsLs5AvbAorfWyso6zqArJzybwCR30+WArm/qPi2
         wN0tXuqOUENkMLlKNZZgVRm7he2Ww9TphOKIp4BQTFV+JSE/KJ7qJVuSAryHVJX7Vv/C
         NydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lKRmpKmonuyhtIYX9JXaoktO3MKvyjTBa6sH4cggBwI=;
        fh=paNwgSTAZAGKsUs1r/OYVjNz8+PETGRFGw0ey5W4XUs=;
        b=H0ZCDUJ1iGvteQ1q9H0vEFFzB4Nx12YP2fn1KU4kkNhBQR3SQrii3sNTgs89CAGYUj
         FGpcvyn5HwyKVlDqYc1DdxYmJaiIUQcYU2yhKlHnZwPJSzD16uoYvvTA8Lk+6OFhyvqk
         ZUZ9AYz+vhVLAhAo8sLauhGLteGmDGbocc/w4j3jfaUj0JHO5iCATKg7oUoz0CaGDhbD
         71vPitW49o6bRor6Fu9ygHHEwLCXwygdPSyqV3BOVvjYHrUmkjDUMrshppgQLbTFzqFY
         OshLxTi2zclUl1BK3zmYUgGH7N0qF6msl/O6Uzena8eWQRG9HlkI80UMX0WPS26XX9zN
         pB+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781675098; x=1782279898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKRmpKmonuyhtIYX9JXaoktO3MKvyjTBa6sH4cggBwI=;
        b=LbPwuP9lPYxZsmdj3DX1p8EBqjVDjRlCSXkNXwAUENBK2aM7CgWwVi91pLZ693qRGo
         1Msavsh8bxYtAIC4v2owOC0LB5mpe22FT+c63h0Yay1+fIRQcLGgu5eXUdp55jmKGdyI
         qdDZ1iE87k36gVYP7fpVpszElTjQX4L7lhwXLELAOKVFlJMiiJEHgazOtIUHYiBxxo5F
         i8fPXT2x1ee7VozZdanJRyRKPsMfZTUPd7FufhZZ9Vvbs3Oog7jS+MN7TLj4BYll4nYc
         PE0IrXui/JktuSCzavWu4E8wBdMERDFLJ/6D+QRwBkSg62YQsF9zF8T5djyHviUPTW29
         LctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781675098; x=1782279898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lKRmpKmonuyhtIYX9JXaoktO3MKvyjTBa6sH4cggBwI=;
        b=RsWYxTROqrqTOO3FsXPitSGXZbl3e+7nlo6HejcDVvyItWeaZJ+qjHBy+hOGxcL7/H
         4kEhoYej4UlsXlHUGeZm+eN5G+uNX1RiCAEU8Dwyhqx1YMZvR2fH6efWSJ7uPjb2uKmd
         BHpviP2ulLSnMzGFvxL84sE8ER+NCp5Gx60BRYEvYUe5ukf8UYer+ndrJ7lHX2XHm8Zw
         DoBZpCNCWQBj5I8a4FjdlbYamdHhcDSTKzGZF1kBiLasx9K5UtZgmUzCo4Yl6CQ0iwc3
         BRaS+yWpfr6VUGDFXJURx+SOcGc8qD9aP5cZoR5BWpMxztafpaTeUrkBlHe88h+m/sJE
         JYOw==
X-Forwarded-Encrypted: i=1; AFNElJ/8woAA8rqnQn56XPj3KEOsRsr95ldOqs+9bpRCiwePgitUYvdYdNUNEix5GGon64H09HH8OqS+hnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YztmAKKOMNc3Sz2HZr6JY25BYpeUwAetbLjNR2l0WkTV/qNqhkl
	Hh7fKfv8s1Uxlr3xvQhMKz8iVuITbVbwDV8MOuKC1wTxRs+o7Zm5rwJhyJ9qH5annGSaR1WTGLL
	cXetG2SJtaTXkyeaXfbJo+VxEPyMVlRc=
X-Gm-Gg: Acq92OFc67vL1JeFHvmsaZmcSwkxCvP6mUfC/NBpGObCXAvR9zkeK0pPqMk7bwfom6L
	neuf60LAgDfJXqlZuEBiQzRcoN9gvSCvQQfwyPAZpQ6PtFun4Eea8g8MqqBln1UXX7AMbz6LmlQ
	GsZc0SRAYlPrMmPsRZlKOkZ1TVfyufjIc39M8Xzlueazn/BMMtP6FSJrhB1b2c1sNKHKX0PQ+I6
	sXqGVLpWlMb/gVDgi4ejM/tlCcM9KKB9fwpalmVLkdO1uYBEo6dyr81qyn222hfIC4EmciHVTzq
	UisbW63dCscMnzNRaRmgM+R93A==
X-Received: by 2002:a05:6809:392:20b0:486:a606:c6b5 with SMTP id
 5614622812f47-489429be925mr1512679b6e.23.1781675098075; Tue, 16 Jun 2026
 22:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260616123646.GB21024@lst.de> <CAJxJ_jhK+zkpjhs3YsQ9RoasKYh+E0NweQci0sPAEY1ne5LmBA@mail.gmail.com>
 <ajIYFtADxQDq8q1P@google.com>
In-Reply-To: <ajIYFtADxQDq8q1P@google.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 17 Jun 2026 13:44:45 +0800
X-Gm-Features: AVVi8CezmHOQc6ccEaHRKEOgVGFkbymHQDWys_oD7V4L8KIfGzy5Bi0-OqnliFw
Message-ID: <CAJxJ_jiM_-a52EOm896FXkdH+wRxjSHJx+MW6b-ewNLVkp4uSw@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brian Geffon <bgeffon@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92597-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:senozhatsky@chromium.org,m:hch@lst.de,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:bhe@redhat.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:youngjun.park@lge.com,m:minchan@kernel.org,m:axboe@kernel.dk,m:willy@infradead.org,m:jack@suse.cz,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:bgeffon@google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lst.de,linux-foundation.org,kernel.org,redhat.com,gmail.com,tencent.com,huaweicloud.com,lge.com,kernel.dk,infradead.org,suse.cz,kvack.org,vger.kernel.org,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,chromium.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 285FC696A87

Hello Sergey,

On Wed, Jun 17, 2026 at 11:46=E2=80=AFAM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
> Can we elaborate on zram being a "legacy interface"?
My previous wording was ambiguous. Actually I didn't mean it is a
legacy interface.
Previously I just compared the new compressed swap implementation.
AFAIK, zram is widely used in many products like Android, automotive and Io=
T.
Its usage and interface should remain unchanged, as the impact would
be significant.

Thanks,
Jianyue

