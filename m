Return-Path: <linux-doc+bounces-61444-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC16B8FC48
	for <lists+linux-doc@lfdr.de>; Mon, 22 Sep 2025 11:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1640D42023E
	for <lists+linux-doc@lfdr.de>; Mon, 22 Sep 2025 09:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489602D94AC;
	Mon, 22 Sep 2025 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtqRVKgw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB62882A5
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758533617; cv=none; b=GCgw9IbkQg8PK9ASFeZNuuyauz1zWcA0wbpl15XS03OqY+ARUptrSVU7/e0yNuHjZhG6YPY3N5ZV0z4xk5aHjYEAYmGTKwNQHn28n+pdBJksLnSF9GEsdEX2FPo3xHB/mVfvIb+suItN2EyIov8zzS2Ph9Idc1MgnqOAv2dCuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758533617; c=relaxed/simple;
	bh=uR7IyOLN2X3biDgABs/idhTRrUaMmnWVYyN/UzgtCKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gv0t3VogfL5i/wSDZfDso2HUyJ2R6wPiF9a7uOR06OUReCwWGq/mvLrw6HB8fVowX8UkpgTGYQ/hqWAilDI148xx1m6pMIj359ES8uaA3b2wYYxT4asc9MrJA2kRi1eCEuPYCu9HagZjLDaq9UnYSHLX9bDJhSKZqKoJfmNXuhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtqRVKgw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so24394065e9.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 02:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758533613; x=1759138413; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89qPC2dMk40SQhoKG37yGCiQt/NY420sGfty0Meng0w=;
        b=rtqRVKgwXVLDUPMcssfmWmAiw96i6zfxA/t2vqhdNA5YUqKeezt2pPCKNqVyuYTQE4
         gVXMk/0hOTwX4zwKdwi3p146YZma2gcgaSCBW29dZqy7v7TEgm2EGs84QxoYNsAn1znb
         slwzGELxqwII971SnlHT1bDj6nwjAKtx20WV+dXWzoBKLw4zi9u0z8u4f7HVH9w+TcqV
         fk7//ZiYPMZISgktY4gCh/huytX2ZwLjvMMgStS6ETfULKiiydWXMY4YMns37F16PFVb
         6hWHTbG4lZj71aB+/CtXTslBsPyT7fXYYYekfTbAhGw5cudJI4ZwVFn3PDSnYXowHJ5p
         kIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758533613; x=1759138413;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89qPC2dMk40SQhoKG37yGCiQt/NY420sGfty0Meng0w=;
        b=UsPwJYKW4z/IIRwAWH+kWFz260HHnJ35f42sx69sjHvyJXep0B95fqGT00FJiVZMPY
         ZK8PpfTszHihGKu3z9JzQjL34W2HeiFBF+eHHY+MNekT2hCi20r8Lrg90xb2DdmtRjaO
         eJ+y8QmuZaqFTTswWge7An2NWax0u9A0q46rpSSPIm711FVFEiSNCqbo6fa5nMotBXIe
         squibLW2zUmQz5KF4RqAwxgKqeVjRmBzoxdRuEzYfF8TMEAcHi+H1nxjohDknGm+Vs13
         4q4r4YDjzXLsGN9+vS7bRtAu0SUpsIIk+kDIhjIR1Lf26+ziRF5MIsB/AMRQn3yAP45l
         U0kg==
X-Forwarded-Encrypted: i=1; AJvYcCUL8i8l3N4c86CT/0XZ0b1sUsClyDfW+4RGRE5Zvi1BSI+DVuwv+sK74kjwVMuWwGcyekgQQ2l6Vp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW10BwnLuRkW3A6LyXCDeN0tVhCLPOHLcynSco6EW/14rLeRxn
	FDsVsCeXY0EuUiuUeQCjgnagZ1UWAQ5NBVvgLpHzwaZ/dhGC44l2DIY3+CmFToCdOQ==
X-Gm-Gg: ASbGncu6cWYdOANIij+mFqt+CADhUaK0N9FxlAL92guleVQpDyMMH4cd7hxC9LRzMX5
	PuSVwSPP/u229zXQjOA9bfvNYctYTTHx9LFIxSxsu9zx3Vtu1XwdYjExwCt1W5m2cHm7DY9cwUJ
	nfOsMVjtn++zL3zQxW46AvVv6P1BlsOg5hAhvmTy0dShXeXtrZLxVNwuJkbK25siiclO0h05syZ
	YCLlHIElmBWI/C7coJ4M1BvhV/MU+RNOmpEqcaYD5Mu/85UV4114n91dzRkjtHeGx2i41YWR4F/
	Q9gYzLVIs5tUCw5WojrsxU4UjNDu3N7/q4ycEZcL23GiFvPu36+TpADLMQI/rDx3BG2KqYU2PuC
	yUWSdohtyqj6J6yLp4vkOl98ILS2H9BMwWThAvbwD7eXC3ytO8NvfSaqjmTI=
X-Google-Smtp-Source: AGHT+IEkoU9ognY1IS2/WNXTQHBehT3iG6jr+rUMfSA5BLARxzu2twytBIMtwJpeHRGrTnG81Cn1IQ==
X-Received: by 2002:a05:600c:46c6:b0:45b:804a:a65e with SMTP id 5b1f17b1804b1-467ebbbff33mr123610355e9.28.1758533612329;
        Mon, 22 Sep 2025 02:33:32 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:8fed:21ad:ce77:2e15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46d1f3e1b03sm39713145e9.23.2025.09.22.02.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:33:31 -0700 (PDT)
Date: Mon, 22 Sep 2025 11:33:23 +0200
From: Marco Elver <elver@google.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, llvm@lists.linux.dev,
	rcu@vger.kernel.org
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
Message-ID: <aNEX46WJh2IWhVUc@elver.google.com>
References: <20250918140451.1289454-1-elver@google.com>
 <20250918141511.GA30263@lst.de>
 <20250918174555.GA3366400@ax162>
 <20250919140803.GA23745@lst.de>
 <20250919140954.GA24160@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919140954.GA24160@lst.de>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Fri, Sep 19, 2025 at 04:09PM +0200, Christoph Hellwig wrote:
> On Fri, Sep 19, 2025 at 04:08:03PM +0200, Christoph Hellwig wrote:
> > I started to play around with that.  For the nvme code adding the
> > annotations was very simply, and I also started adding trivial
> > __guarded_by which instantly found issues.
> > 
> > For XFS it was a lot more work and I still see tons of compiler
> > warnings, which I'm not entirely sure how to address.  Right now I
> > see three major classes:
> 
> And in case anyone cares, here are my patches for that:
> 
> https://git.infradead.org/?p=users/hch/misc.git;a=shortlog;h=refs/heads/cap-analysis
> 
> git://git.infradead.org/users/hch/misc.git cap-analysis

I gave this a try, and with the below patch and the Clang fix [1],
fs/xfs compiles cleanly. I think the fundamental limitation are the
conditional locking wrappers. I suspect it's possible to do better than
disabling the analysis here, by overapproximating the lock set taken
(like you did elsewhere), so that at least the callers are checked, but
when I tried it showed lots of callers need annotating as well, so I
gave up at that point. Still, it might be better than no checking at
all.

[1] https://github.com/llvm/llvm-project/pull/159921

Thanks,
 -- Marco


diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index 9c39251961a3..f371a08e5d44 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -140,6 +140,7 @@ void
 xfs_ilock(
 	xfs_inode_t		*ip,
 	uint			lock_flags)
+	__capability_unsafe(/* conditional locking */)
 {
 	trace_xfs_ilock(ip, lock_flags, _RET_IP_);
 
@@ -183,6 +184,7 @@ int
 xfs_ilock_nowait(
 	xfs_inode_t		*ip,
 	uint			lock_flags)
+	__capability_unsafe(/* conditional locking */)
 {
 	trace_xfs_ilock_nowait(ip, lock_flags, _RET_IP_);
 
@@ -243,6 +245,7 @@ void
 xfs_iunlock(
 	xfs_inode_t		*ip,
 	uint			lock_flags)
+	__capability_unsafe(/* conditional locking */)
 {
 	xfs_lock_flags_assert(lock_flags);
 
@@ -272,6 +275,7 @@ void
 xfs_ilock_demote(
 	xfs_inode_t		*ip,
 	uint			lock_flags)
+	__capability_unsafe(/* conditional locking */)
 {
 	ASSERT(lock_flags & (XFS_IOLOCK_EXCL|XFS_MMAPLOCK_EXCL|XFS_ILOCK_EXCL));
 	ASSERT((lock_flags &
diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index d9ac9521c203..9c4ec3aa8bf9 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -472,6 +472,7 @@ xfs_log_reserve(
 static void
 xlog_state_shutdown_callbacks(
 	struct xlog		*log)
+	__must_hold(&log->l_icloglock)
 {
 	struct xlog_in_core	*iclog;
 	LIST_HEAD(cb_list);

