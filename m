Return-Path: <linux-doc+bounces-83264-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJRiAh4h3WndaAkAu9opvQ
	(envelope-from <linux-doc+bounces-83264-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 19:00:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB203F0774
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 19:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3367830364EA
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 16:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E94D223DCE;
	Mon, 13 Apr 2026 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Rjtkm9F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u5HQaj0R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Rjtkm9F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u5HQaj0R"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B88323E342
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098912; cv=none; b=svA8shAK4Vyw+H0ce+kn5ZJKxTp7d1+5Olc7tMiu+urrruVt91d/XKFeEN/2XeT4RIMjj2PgapRv2hrBoQygc+LMG/Fwygpev7E5XJnXZL/KUvQvEwyTOvDSKUoW6zpG9bEnZNZAxAsMgX9xjtcW7uFODvfCvOuVPa0Qynyhf0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098912; c=relaxed/simple;
	bh=3ZNdutJTZCIir4cEZCHDVQDyD++8K7aKyOaSXsrl1Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jn3culNWJcJg3aEdXRsPA5rSFTWoRrrZRPI5I/faCniJdZoZfIxBwv5Du5KybwgqNe4xhPWzkLpjd5hYNygsGdq4z7ksVp5JeREZZyqG5jihCN3VPnK+PYhg/KtvdzBvtdiRCOx7RxtuAOpkjH8wMZ5x/qOgVYhjDPxDgb0azRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Rjtkm9F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u5HQaj0R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Rjtkm9F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u5HQaj0R; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B3245BDE2;
	Mon, 13 Apr 2026 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776098909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhYl+zfnnZblysGfhddsW421+r8fb0OK3WMKk04BntY=;
	b=1Rjtkm9FXnIHCxpko/RYPz5JVKCmrWLdupLpXS13XwEJqEWA1UE61vtbcBaSrq4ieEj9Jn
	OTJCTnuMMVvAeS6sZdWy/GjqowNp0WtMfbWJo0B3aAWqXUfwp2ac31rCzh2RUGhFPhbPDw
	I2CclffFbMFIzhlq+tZsK732Y6QGerg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776098909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhYl+zfnnZblysGfhddsW421+r8fb0OK3WMKk04BntY=;
	b=u5HQaj0RVm3E4HSPIRVwvA21DrOaQzc+Z2W1gfCI+C19+ZFXmRvdShkKxe+YzO2GyZVVmm
	AmgforSERSNw16DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1Rjtkm9F;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u5HQaj0R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776098909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhYl+zfnnZblysGfhddsW421+r8fb0OK3WMKk04BntY=;
	b=1Rjtkm9FXnIHCxpko/RYPz5JVKCmrWLdupLpXS13XwEJqEWA1UE61vtbcBaSrq4ieEj9Jn
	OTJCTnuMMVvAeS6sZdWy/GjqowNp0WtMfbWJo0B3aAWqXUfwp2ac31rCzh2RUGhFPhbPDw
	I2CclffFbMFIzhlq+tZsK732Y6QGerg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776098909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PhYl+zfnnZblysGfhddsW421+r8fb0OK3WMKk04BntY=;
	b=u5HQaj0RVm3E4HSPIRVwvA21DrOaQzc+Z2W1gfCI+C19+ZFXmRvdShkKxe+YzO2GyZVVmm
	AmgforSERSNw16DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 845EB4AFAD;
	Mon, 13 Apr 2026 16:48:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E79zHVwe3WlGCwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 13 Apr 2026 16:48:28 +0000
Date: Mon, 13 Apr 2026 18:48:23 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] hugetlb: remove the hugetlb_linear_page_index()
 helper
Message-ID: <ad0eV3hZtE51bTA9@localhost.localdomain>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-3-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-3-jane.chu@oracle.com>
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83264-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[osalvador@suse.de,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,localhost.localdomain:mid,oracle.com:email,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 6BB203F0774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 05:41:53PM -0600, Jane Chu wrote:
> hugetlb_linear_page_index() is just linear_page_index() converted from
> base-page units to hugetlb page units.
> 
> Open-code that conversion at its remaining call site in
> mfill_atomic_hugetlb() and drop the helper.
> 
> No functional change intended.
> 
> Signed-off-by: Jane Chu <jane.chu@oracle.com>

Acked-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs

