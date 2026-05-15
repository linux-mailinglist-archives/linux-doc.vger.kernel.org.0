Return-Path: <linux-doc+bounces-87762-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SILyLmebB2oD+wIAu9opvQ
	(envelope-from <linux-doc+bounces-87762-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 00:17:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E3558B3C
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 00:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE7693051AB3
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 22:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B2A3F39DB;
	Fri, 15 May 2026 22:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tv+IRzby"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1234E3F44EA
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883163; cv=none; b=Qszynbpc9HwpLoryZldDLmyKDG3dBBH61h2uHuU/bVNMzcsuUvpFaBuP7isH18VrnhiLZhR7a2xt/WXdZTnJ60TNPAqpp8ZQsQY6FPnj33juPZheudy6CWffV/GpHjPhM9qNYClz/BRs2xo/XhTbPNr2nqBhLvTCdNjeme6NTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883163; c=relaxed/simple;
	bh=Xo9RN/YaHlAbWe60yDn3HcJADUDb6frVOkoaJStZf5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0F6lHTTWHEQwwLLRKv5mnObmtRCx0pOWnE04GeouCMDc7JJ63IQjh4H3WP3rGe1MA3fn4YjYARkJR5s8uh8yRSUNXG+dEo0+srtnTz9ZW9F91rmsInBBoqTZ4VPZGkno3Qy7lU4IgvCAaqnbFVCpkxMJTxYljdcAxB5c+yv724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tv+IRzby; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6D5C2BCF5
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 22:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883162;
	bh=Xo9RN/YaHlAbWe60yDn3HcJADUDb6frVOkoaJStZf5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tv+IRzby0Wc1y1AfRAfBW3nKPJfKGSdDUKMAC83W6JZ/dYSjgCeuFvnvRb+k2fDWh
	 xbo5tF45ctQN2+lUP3uiBUSdgPOAi+Wx+0tkvg+4pJup5eskAOQTJlwp6phqJcshLI
	 zwma6B6kmV2AJ2QU39YgSPGY+7u3MZcxTeE3mLdPCH/vhNyTGPwjMe4zxLH36reM8B
	 Aer/b8HC7tlHs6JLUSTc8CC6m60eU8oVJuXGFC3sjcHNI2tTjQrIJ4E+efJOd+l39W
	 8dpKuDtdYrLdKdfWZ3TWstbmXaMPftJx2DJhHT9Ud2qtgOsF/sPz15MPQ/jP7lSeCE
	 kkkwEGkOg5Eqg==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c5361142fso700160d50.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 15:12:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+d0N4hP1wq+rCqwS/oyPCgm3KhzD/jV9gG9WpS7pgmfrBrm8+MRwJmHJn6jtqBtGRs01pNMW6XxiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM0BCsfpWewyU3hM5PKYKlXgDfFuOGjFJWba/ot5a+0nkHzRt1
	YIOcVHRKD4wYkes24t7PZzzMjaq5bE+WCmDrnt4PF9WXupqiX9jAXv98ixJSpLDfmpdgFwmqiq6
	UVRm5CnWQUugTePn37ArwqA01mv2OIzJVt1of/JhgpQ==
X-Received: by 2002:a05:690e:14c4:b0:64e:f106:60ea with SMTP id
 956f58d0204a3-65e22807f82mr6158139d50.44.1778883162092; Fri, 15 May 2026
 15:12:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de> <20260512053625.2950900-10-hch@lst.de>
In-Reply-To: <20260512053625.2950900-10-hch@lst.de>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 15 May 2026 15:12:31 -0700
X-Gmail-Original-Message-ID: <CACePvbVPV55SgPmivqMX+bP8H7FKcSAbWCwAe5icgZjZV9vUNA@mail.gmail.com>
X-Gm-Features: AVHnY4LtC3KSyPNEsLh1ud1t2IOob9XfSBaYZO4ouG71LQM8qOS5lvZuuzrl4N0
Message-ID: <CACePvbVPV55SgPmivqMX+bP8H7FKcSAbWCwAe5icgZjZV9vUNA@mail.gmail.com>
Subject: Re: [PATCH 09/12] swap: push down setting sis->bdev into ->swap_activate
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	David Sterba <dsterba@suse.com>, "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2C7E3558B3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87762-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,tencent.com,kernel.org,kernel.dk,suse.com,mit.edu,gmail.com,samba.org,manguebit.org,wdc.com,vger.kernel.org,kvack.org,lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrisl@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lst.de:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 10:37=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Only the file operation method knows what block device we'll swap
> to.  So move down setting sis->bdev and the special blockdev flag
> into ->swap_activate.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>


The core swap part of the code looks fine to me, I did not look much
deeper into the fs side.

Ack-by: Chris Li <chrisl@kernel.org>

Chris

