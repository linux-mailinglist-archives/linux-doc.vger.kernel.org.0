Return-Path: <linux-doc+bounces-13411-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDA89789A
	for <lists+linux-doc@lfdr.de>; Wed,  3 Apr 2024 20:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60DF1B2E0A7
	for <lists+linux-doc@lfdr.de>; Wed,  3 Apr 2024 18:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4923715382F;
	Wed,  3 Apr 2024 18:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O+mF5tSo"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B43153501
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 18:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712168132; cv=none; b=JMuyAKUbkGZH/fkuY7JsoQ/iqpmszKpkRfzVi6LidRKwhXvEEG2PQsz12SnFdBBiphipt2b6BuGiwwvAkzUy31rRDhtE//Wykf16QRgiFr9d57TOm4NNlKPSkf9GcKX86ohlcOq5l59X2UfR0udlUOW+PiBkKqWi+y2pKV5ghBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712168132; c=relaxed/simple;
	bh=1oV7F1jBmYRZsA6svOOmuWXQI3vYZavB0QFuGC36KRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ93pdani677oexQuRpoFWPFGUQkLeG92Vaf2mmqNQRjRdArFnLWGCrEvWw1bXAGRglNxQqEA5zWRLNWgYNTH/22W8DHsF0IeurP+wYXSeTAAL5HFArKh93N5lWhXsXOTXl082InHtDi5lRSql2KuQmZDPueITxzwD/w8fWPyhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O+mF5tSo; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 3 Apr 2024 14:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712168126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KugM06W/s0lb++bW7levKHgpFLyEAtmCAECxADz00LA=;
	b=O+mF5tSo+kQ3evl6evxwBacTiXzfRDinz7tasCBoCXvkVzg71Eg2Tj11aOOQOvAn2VtbKa
	4xDUzXt3vcUN1q4BynOenQTSxBZUR+PUrwJNN863OgeLxrPH8kAqph+irAR/22JqAk8WiC
	UUHnl3AUbkMRomaUH0xPDBYfDm7mIPM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Brian Foster <bfoster@redhat.com>
Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Jonathan Corbet <corbet@lwn.net>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 11/13] bcachefs: fiemap: return correct extent
 physical length
Message-ID: <qf3rldn7sha5nbwz7iidkzb6secoyebwldgq56tfx4sunmthxo@qdap46g7lfsc>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <b9b795987a485afa0fdb8f0decc09405691d9320.1712126039.git.sweettea-kernel@dorminy.me>
 <Zg2LG1_2-ac1GlsG@bfoster>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg2LG1_2-ac1GlsG@bfoster>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 03, 2024 at 01:00:11PM -0400, Brian Foster wrote:
> On Wed, Apr 03, 2024 at 03:22:52AM -0400, Sweet Tea Dorminy wrote:
> > Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> > ---
> >  fs/bcachefs/fs.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
> > index f830578a9cd1..d2793bae842d 100644
> > --- a/fs/bcachefs/fs.c
> > +++ b/fs/bcachefs/fs.c
> > @@ -913,15 +913,17 @@ static int bch2_fill_extent(struct bch_fs *c,
> >  			flags |= FIEMAP_EXTENT_SHARED;
> >  
> >  		bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
> > -			int flags2 = 0;
> > +			int flags2 = FIEMAP_EXTENT_HAS_PHYS_LEN;
> > +			u64 phys_len = k.k->size << 9;
> >  			u64 offset = p.ptr.offset;
> >  
> >  			if (p.ptr.unwritten)
> >  				flags2 |= FIEMAP_EXTENT_UNWRITTEN;
> >  
> > -			if (p.crc.compression_type)
> > +			if (p.crc.compression_type) {
> >  				flags2 |= FIEMAP_EXTENT_ENCODED;
> > -			else
> > +				phys_len = p.crc.compressed_size << 9;
> > +			} else
> >  				offset += p.crc.offset;
> >  
> >  			if ((offset & (block_sectors(c) - 1)) ||
> > @@ -931,7 +933,7 @@ static int bch2_fill_extent(struct bch_fs *c,
> >  			ret = fiemap_fill_next_extent(info,
> >  						bkey_start_offset(k.k) << 9,
> >  						offset << 9,
> > -						k.k->size << 9, 0,
> > +						k.k->size << 9, phys_len,
> >  						flags|flags2);
> >  			if (ret)
> >  				return ret;
> > @@ -941,14 +943,18 @@ static int bch2_fill_extent(struct bch_fs *c,
> >  	} else if (bkey_extent_is_inline_data(k.k)) {
> >  		return fiemap_fill_next_extent(info,
> >  					       bkey_start_offset(k.k) << 9,
> > -					       0, k.k->size << 9, 0,
> > +					       0, k.k->size << 9,
> > +					       bkey_inline_data_bytes(k.k),
> 
> Question for Kent perhaps, but what's the functional difference between
> bkey_inline_data_bytes() and k->size in this particular case?

Not much - k->size will correspond to the size of the original write -
that is, the writeback write from the pagecache. inline_data_bytes is
the amount of data that wasn't zeroes.

So inline_data_bytes is probably the right thing to use here.

