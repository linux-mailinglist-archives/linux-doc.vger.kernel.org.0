Return-Path: <linux-doc+bounces-91947-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NN5xBUCZKmo4tQMAu9opvQ
	(envelope-from <linux-doc+bounces-91947-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 13:17:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A35536713B8
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 13:17:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h7gGhUHC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3oX5UDZz;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h7gGhUHC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3oX5UDZz;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91947-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91947-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6C4231D0166
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E913DD843;
	Thu, 11 Jun 2026 11:13:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9353DD50D
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 11:13:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176417; cv=none; b=tN9LiGkHr+00GWgGqp0w3DZrqKp9MhSA+rJRe1YpqrumY1Acqd4B7TZj0M6bpBJUnatYGRAcX9PhNyIVNiTwnSRlclZ6dq6TjHpwvKBmahJS4jaXTrDCRC7GLEOzLBjlvUmQNUfZqDRrM9GMalmTkNnNTs48IXLHxq0QQmQ/wKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176417; c=relaxed/simple;
	bh=yX+biDOJMWTtKkH3Cw9JnqrWk90JigwtHAtrPYqc1mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovjTV8cWWyuWeKprXrYRhezBhUgWoWaEozUYSLnc4M/UvCzS2jVN7mn5hvg8qzVudciK3i/K7cekTXAShg/JdBqGm2W6cT7vHkUMEN6D13zP+pargsyCtcS51n7GLeD3zaYqp8Ax54UFFe7fMku7ZC/xDkR85hZr3y/8uEbK/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h7gGhUHC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3oX5UDZz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h7gGhUHC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3oX5UDZz; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B6257595E;
	Thu, 11 Jun 2026 11:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781176414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uTPmKDC2++fFuX1IGIaCfTosGFLn7J/XiVm22BhhlKY=;
	b=h7gGhUHCMWHR9qmMcGC0AoT1CAbC0qDA+DovzA8zAz7H7fQv0PFs7CPOjJnxhCdFaDcGUu
	vyvAK0DfyY1RdmfXFklPCJyPNhMzAuw2CP1s6N7qwcEYWiR5mxL9DG/5BysO6PhZMxKoKD
	ISZg6RTIwJecj6GxaQYPdfgUtqJTzRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781176414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uTPmKDC2++fFuX1IGIaCfTosGFLn7J/XiVm22BhhlKY=;
	b=3oX5UDZz+h4XTy4ey9XkDARLpL0LSp4+oHtkq9J8VDyjYLcXPfbAOHxVyfqg6po5L3jIcS
	rP2TI5nu7gaMawCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781176414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uTPmKDC2++fFuX1IGIaCfTosGFLn7J/XiVm22BhhlKY=;
	b=h7gGhUHCMWHR9qmMcGC0AoT1CAbC0qDA+DovzA8zAz7H7fQv0PFs7CPOjJnxhCdFaDcGUu
	vyvAK0DfyY1RdmfXFklPCJyPNhMzAuw2CP1s6N7qwcEYWiR5mxL9DG/5BysO6PhZMxKoKD
	ISZg6RTIwJecj6GxaQYPdfgUtqJTzRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781176414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uTPmKDC2++fFuX1IGIaCfTosGFLn7J/XiVm22BhhlKY=;
	b=3oX5UDZz+h4XTy4ey9XkDARLpL0LSp4+oHtkq9J8VDyjYLcXPfbAOHxVyfqg6po5L3jIcS
	rP2TI5nu7gaMawCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CEF1779A7;
	Thu, 11 Jun 2026 11:13:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wxlKO1mYKmqmDQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 11 Jun 2026 11:13:29 +0000
Date: Thu, 11 Jun 2026 12:13:28 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Huang Shijie <huangsj@hygon.cn>
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, muchun.song@linux.dev, osalvador@suse.de, david@kernel.org, 
	surenb@google.com, mjguzik@gmail.com, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, shakeel.butt@linux.dev, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux@armlinux.org.uk, 
	dinguyen@kernel.org, schuster.simon@siemens-energy.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, djbw@kernel.org, willy@infradead.org, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	mhiramat@kernel.org, oleg@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, linmiaohe@huawei.com, nao.horiguchi@gmail.com, jannh@google.com, 
	riel@surriel.com, harry@kernel.org, will@kernel.org, brian.ruley@gehealthcare.com, 
	rmk+kernel@armlinux.org.uk, dave.anglin@bell.net, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, zhongyuan@hygon.cn, fangbaoshun@hygon.cn, yingzhiwei@hygon.cn
Subject: Re: [PATCH v2 1/4] mm: use mapping_mapped to simplify the code
Message-ID: <aiqYJTJFIHHk_IOt@pedro-suse.lan>
References: <20260611061915.2354307-1-huangsj@hygon.cn>
 <20260611061915.2354307-2-huangsj@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611061915.2354307-2-huangsj@hygon.cn>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,zeniv.linux.org.uk,kernel.org,suse.cz,linux.dev,suse.de,google.com,gmail.com,infradead.org,suse.com,lwn.net,linuxfoundation.org,armlinux.org.uk,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,arm.com,linux.intel.com,intel.com,linaro.org,nvidia.com,linux.alibaba.com,huawei.com,surriel.com,gehealthcare.com,bell.net,kvack.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,hygon.cn];
	TAGGED_FROM(0.00)[bounces-91947-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[pfalcato@suse.de,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:huangsj@hygon.cn,m:akpm@linux-foundation.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:mjguzik@gmail.com,m:liam@infradead.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:shakeel.butt@linux.dev,m:rppt@kernel.org,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:djbw@kernel.org,m:willy@infradead.org,m:peterz@infradead.org,m:mingo@redhat.com,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@li
 nux.dev,m:linmiaohe@huawei.com,m:nao.horiguchi@gmail.com,m:jannh@google.com,m:riel@surriel.com,m:harry@kernel.org,m:will@kernel.org,m:brian.ruley@gehealthcare.com,m:rmk+kernel@armlinux.org.uk,m:dave.anglin@bell.net,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:zhongyuan@hygon.cn,m:fangbaoshun@hygon.cn,m:yingzhiwei@hygon.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pfalcato@suse.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pedro-suse.lan:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,suse.de:dkim,suse.de:email,suse.de:from_mime,hygon.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A35536713B8

On Thu, Jun 11, 2026 at 02:18:57PM +0800, Huang Shijie wrote:
> Use mapping_mapped() to simplify the code, make
> the code tidy and clean.
> 
> Signed-off-by: Huang Shijie <huangsj@hygon.cn>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

LGTM, thanks! Super uncontroversial so perhaps
could be picked up separately.

-- 
Pedro

