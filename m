Return-Path: <linux-doc+bounces-20508-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF792EAF9
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 16:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD8BD283C88
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 14:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8AB169382;
	Thu, 11 Jul 2024 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b="q1PXf1Gy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551016A930
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 14:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720709078; cv=none; b=Rgi2uG1hNbzuXrRCDqu/V61sjTkqVVs0zcGvNcpO6fwiVY7wT8nj481UaII9EEjf4ujV//WnOFkC52fv3WvxHMR9NQ+hEDRNStPdlHVb140Pp8RsAeAhGx5RCak4d7VhTX/UhAbVpIR0lwHodjbSouLOQRc66kc0YQJB4NzjqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720709078; c=relaxed/simple;
	bh=MMu6kiGgrdyVeIGgo0o2g5ISXoiklOJgpiyd0c6Mhcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCWxO5ltvvmUYd1cKIezGcfprAjH8VCK1MsRQPLA2TMNGHSSLPTaXNABOERnZGbaq/UVZ3PAw2UEq7pm2hqk2PSoEhPjti2neDbIA7NlxFMuPwP0TbB1VPpg/Xp9qN7nRr+TMrmtT613MP0IvwuvoXvVdnSwEueH/BPjx+t442M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=none smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b=q1PXf1Gy; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toxicpanda.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-65651296d91so8568727b3.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1720709075; x=1721313875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p6PLNSJZMY2HBtPFlfBgNDPZWDEOAS/uY6eb53FVzXU=;
        b=q1PXf1GybYh1aDXkOQriXh3etXHQaQvAEvEHvmjzflwesjMtmTkIcKjsvkM3cvyMew
         1ADOSrKUCZeN1Bc6ndt1rYxk0DDfHkzu9xezqPuUzubgvhJWQPvuMkrPn/0U5ZZxfo9i
         fctEzUyU1X+gwXWNkJGT6Qb6Rul3J21Wfk7CiQmTfo+8/rA+YGP6qKw6dLORH3DeagL/
         y8faZ8jpGGnpY3BUumaQJl7BBvPzevdG9+6FJ6dQodNUGNJSp/gYUNCG5drWdvmjx5Mn
         cv8yTWT0bLgjhtN0Oa3FCF0hNCixvqUBhriTBD67tVMd36sVAEQFtLzVdeP7ReM7JUpg
         nXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720709075; x=1721313875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6PLNSJZMY2HBtPFlfBgNDPZWDEOAS/uY6eb53FVzXU=;
        b=SBP7ruuffi021Uh3RZ+Ra+h18qpWJRZ1+xgdVOTJRjC39ERCTqbE2hJjJreGmGGa4D
         cLZHJgCty3bbxd3T9q19A8dvq0+ZmsQCvBebtYh1ltix7beEaT+Ree6Yz+oICSj34Krn
         F/y5arAvhBvYUs2+ljiEOg7KVD0QfC3bcSPNvb4O3GlN4MRf6xBAXGKvgjPIue+gY0Ht
         AUpvFiTcqmlO8z/t3YypS7MPernWgzXzbvIv1H+mo1qjRDTS7mPyPptUFR25D9aE/QiF
         +kpDkiMaDbmfis4xCI3Es7wBGXcSaqmFNyhWze06hw7jteE80T5BC0HNQjFn89ZpJiSj
         qQDw==
X-Forwarded-Encrypted: i=1; AJvYcCVfcQdOQqLFoWyD7Vh5CS+Ri0zJirG3mm95hmpmnBYnECLWB+1uPsWtbJVFKiCw8Rd2xFdo5hfbfGp67WA+Aare5BmMLZmIN+MW
X-Gm-Message-State: AOJu0YwGnAiSjR6XDsdMvSLnMMhpcyppMQHkDuBUBKNEq9PBTrjnQdvc
	b3CDZ3wYIOUnt7schUTJxLck4FvOPyJisgtzCc2A6E8tklJQqDgrfiOOuXvldDI=
X-Google-Smtp-Source: AGHT+IFAnEDVnsGx1tZ1AxBo1QTn+tOSC2MfALvNb6Q+MllvTQBzHLMq8T3kjDK5yp3+1lqcT3GiRg==
X-Received: by 2002:a05:690c:3385:b0:62f:2553:d3b3 with SMTP id 00721157ae682-658ef3414eemr120805467b3.29.1720709075414;
        Thu, 11 Jul 2024 07:44:35 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4936079sm11198567b3.15.2024.07.11.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 07:44:34 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:44:34 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Chandan Babu R <chandan.babu@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Dave Chinner <david@fromorbit.com>, Andi Kleen <ak@linux.intel.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
	kernel-team@fb.com, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-mm@kvack.org,
	linux-nfs@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/9] fs: multigrain timestamp redux
Message-ID: <20240711144434.GB1235314@perftesting>
References: <20240711-mgtime-v5-0-37bb5b465feb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711-mgtime-v5-0-37bb5b465feb@kernel.org>

On Thu, Jul 11, 2024 at 07:08:04AM -0400, Jeff Layton wrote:
> tl;dr for those who have been following along:
> 
> There are several changes in this version. The conversion of ctime to
> be a ktime_t value has been dropped, and we now use an unused bit in
> the nsec field as the QUERIED flag (like the earlier patchset did).
> 
> The floor value is now tracked as a monotonic clock value, and is
> converted to a realtime value on an as-needed basis. This eliminates the
> problem of trying to detect when the realtime clock jumps backward.
> 
> Longer patch description for those just joining in:
> 
> At LSF/MM this year, we had a discussion about the inode change
> attribute. At the time I mentioned that I thought I could salvage the
> multigrain timestamp work that had to be reverted last year [1].
> 
> That version had to be reverted because it was possible for a file to
> get a coarse grained timestamp that appeared to be earlier than another
> file that had recently gotten a fine-grained stamp.
> 
> This version corrects the problem by establishing a per-time_namespace
> ctime_floor value that should prevent this from occurring. In the above
> situation, the two files might end up with the same timestamp value, but
> they won't appear to have been modified in the wrong order.
> 
> That problem was discovered by the test-stat-time gnulib test. Note that
> that test still fails on multigrain timestamps, but that's because its
> method of determining the minimum delay that will show a timestamp
> change will no longer work with multigrain timestamps. I have a patch to
> change the testcase to use a different method that is in the process of
> being merged.
> 
> The testing I've done seems to show performance parity with multigrain
> timestamps enabled vs. disabled, but it's hard to rule this out
> regressing some workload.
> 
> This set is based on top of Christian's vfs.misc branch (which has the
> earlier change to track inode timestamps as discrete integers). If there
> are no major objections, I'd like to have this considered for v6.12,
> after a nice long full-cycle soak in linux-next.
> 
> PS: I took a stab at a conversion for bcachefs too, but it's not
> trivial. bcachefs handles timestamps backward from the way most
> block-based filesystems do. Instead of updating them in struct inode and
> eventually copying them to a disk-based representation, it does the
> reverse and updates the timestamps in its in-core image of the on-disk
> inode, and then copies that into struct inode. Either that will need to
> be changed, or we'll need to come up with a different way to do this for
> bcachefs.
> 
> [1]: https://lore.kernel.org/linux-fsdevel/20230807-mgctime-v7-0-d1dec143a704@kernel.org/
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

