Return-Path: <linux-doc+bounces-87766-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKb9BI6cB2oD+wIAu9opvQ
	(envelope-from <linux-doc+bounces-87766-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 00:22:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBCD558C68
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 00:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90E7B302F40E
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 22:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827993F5BF1;
	Fri, 15 May 2026 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPLUzIqe"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A18F3F5BE8
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883584; cv=none; b=e9aYAd5OKfKJpkNqtqWqGQosnEbI9WFwTzpawC0MBAAci+XZ1kNgoUvREF2JuuhE9onZ/FcYRaG28ywemf9QM30FoVUNHmqi6rGaN1ySmT3DtOSK4LAKdAINdIMhjFvqh8t04wB3T9xm4JafvxWjqahUUvNhsS+5oxjgq0aA1vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883584; c=relaxed/simple;
	bh=W0dCpwZODJFKPu2SY6eKQzfEttHd/2HhQ48IKdHDqaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fG3ZFMJ1zo205wzf5yW5X45n/EIz5JD6LvZ5Irld/807yHFXXGTDov2xS3M/sj9NaYN5aXzz+hGJDgIQ9xgo9kzMn43FUvzxmlK/f4rT82NKHIB6rKgCQ4rPIH5XjGi2X5Sn75gVcSHV8zBWO8M3XMt7OZzv9B5Eg/4TlUN1BYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPLUzIqe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45660C2BCFD
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883583;
	bh=W0dCpwZODJFKPu2SY6eKQzfEttHd/2HhQ48IKdHDqaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qPLUzIqe+TD/Ajtl2DCP1cDvkOJuqKO9ysrycysQpsE+m+xWszTfV+rlfwO2rVKqE
	 9F9C5+WMgR58Dq4JWhybLmVz6E2Gq1ppksYTWnpZZFoGIO2vmeRi1n5dNTZU0lZZUM
	 LHgpphCcyo4hniv1oCFJL/7skvnp5MyvMD82drSl7iHg2CdK9SgPMcT1eji4QEntu+
	 bKqWwOLzI8aqSyUq6S+qUu1FZ0TsUcs+G7zeRfwLEDUj7EhUwoZcp6lrZ+yJD0TAga
	 Y0BGiekqxRPhNJJkDIYjraBHPn27CGWMSn4nt6BcPAwp/tcUOYNTNfVjYZTGnNn7yX
	 yQrUAd2V5+gzA==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65c6a2158d3so469868d50.3
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 15:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8SyJhKRA3B7YnuwjXLuhzmWvsiPskBgqzL4aGxRZTtQ0u5ZFupG3V4zht+SIKW55fIAMm70XjG3ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrmi0aW3JUQh6qMfy6P3T+okdgzX2i0yozSypZtVYPAcoF+6yt
	GXZbGGnmWNIL8yPHhrEhk5tu7FDpX1p45EMSlUx5g5VFYI7G/nyVa43xtrDzwi4ydGaCUaBeqv/
	k5WWG4NKD8d+em4vJqfSrNb879o/drqMIQKV+eNVHwg==
X-Received: by 2002:a05:690e:4381:b0:651:c264:dd61 with SMTP id
 956f58d0204a3-65e226f5107mr4855343d50.7.1778883582591; Fri, 15 May 2026
 15:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512053625.2950900-1-hch@lst.de> <20260512053625.2950900-5-hch@lst.de>
In-Reply-To: <20260512053625.2950900-5-hch@lst.de>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 15 May 2026 15:19:31 -0700
X-Gmail-Original-Message-ID: <CACePvbUgHmSuo_r9WDSD+oMnQeW0537OziTPMt-sRHx96ihg3Q@mail.gmail.com>
X-Gm-Features: AVHnY4JAgCglMa8_5PLakfMWnAw05abJthdzcE1NPle548GazZ3X3WKDUpcNb-c
Message-ID: <CACePvbUgHmSuo_r9WDSD+oMnQeW0537OziTPMt-sRHx96ihg3Q@mail.gmail.com>
Subject: Re: [PATCH 04/12] swap: restrict to regular files or block devices
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
X-Rspamd-Queue-Id: BDBCD558C68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87766-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lst.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 10:37=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Various swap code assumes it runs either on a block device or on a
> regular file.  Make this restriction explicit using checks right
> after opening the file.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Chris Li <chrisl@kernel.org>

Chris

