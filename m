Return-Path: <linux-doc+bounces-76503-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI5iBUqam2nU3AMAu9opvQ
	(envelope-from <linux-doc+bounces-76503-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 01:07:38 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C43170E3B
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 01:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95E61300AB32
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 00:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6FAA945;
	Mon, 23 Feb 2026 00:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6+/6xFa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4820ED
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 00:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771805253; cv=none; b=Q4gCnIcUZVO5mwtymnD8Nq/48+S25fVaaVeTRZeiPacrEb9CFxzm9vkXUybhup5Kr852YhJl2SBv9j+foT0pyDYWFGITD92Q5THmvgZLzhuiP5WslJzO0l72MSalDkcbZtOjUVTbEEpJL+EhWsryRMdhnOJBZ1Tt/cEXp7jCQDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771805253; c=relaxed/simple;
	bh=XL3GK1srBYNctAMCr4LIXYb0AmtCQmrv6sjvkBGn/ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRAz2pEv6k3GSYsaJWu26Ep8zft8sfLvCbmjup3eF/SG7faMmNGwNPaJ6hAYb3ymLgyaoh3iXBYFZBsI6R1wcg6PE96FaTbNkbdgo/nxNO5lgoXyW/4EqtTCjyTI4GpPvbbpsg0j8bQ3kJs9CdFsjTVvdzCWue/S2+pK15yf2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6+/6xFa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837634de51so16661675e9.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 16:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771805251; x=1772410051; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOqNCHYi5/n2sZSN3I12xrG8kdOz0JTtrUngqbnvPM4=;
        b=I6+/6xFabuflN1j6IDRGaaAVtNwTj4IWYSrFztIldfykNe7DpIrLOeAVVsws+Pmx1X
         u6Wnw2MNoDH5HH9gK3vXJaDkva5sJVirUn5ZpiGm9E9hrE1imDiDudpv8BkKU2hqVjgc
         iTNysnOheIjIRlJHFkywNC+0PH9RRVL2JV9qTXf9QzG1BAcNIQ6r9Kp1947b0Emh46Cu
         WRcvIUJQKC61ZRxAZR44E9V5Cbg4XBYHfU/Uudkwb7tGPWmqV/EiCZtnpMNSk8DVyJek
         pVKZGzFFqFlUeuhOjyDXec7SAzIlI04xxI8h3G5AX97QS5NjcnAyxbdnjc2vuYq+yxX0
         8b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771805251; x=1772410051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOqNCHYi5/n2sZSN3I12xrG8kdOz0JTtrUngqbnvPM4=;
        b=HjSWzoeNHdkFyME9eIQQTYC3sRdVmCjCHEA4YFZRaYo2QkbaJu5fRvy0nTP9u7Abzs
         AGlye251fjFdQ0BY1Y9uOc/al/0xD9blPgZpCRIu4ig95yNkRRJvQBCTQc8d1v+G0bpW
         F8jr26/nHJ8yKD+oNmKxIB3VAMJ8Ek7BScKMc1FynKODGk4IxvOCq1iRDtlgNJpcmM9u
         wY/Wws81IboLeriiSgBfxMyduoQdgXf1Zq2D8kqf9JcZEUcJG31ys9jqfD2p/UgeGOrx
         K5xKi7t5HdmUgw7phHH8Y67k3Sly+QVEPQvkJ5qnw0HZqJ5oWq7nxYgc1VwC8UNU2U97
         4F1w==
X-Forwarded-Encrypted: i=1; AJvYcCWWKLB61McDPES/+YBwsidwfWx/1Bmpzb8bhUaqQFZcb8K3+uZ26FMgLA1SwDF9Vo6dYr/Q4IKcipU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Bq70TwhPB6RxtkKPQ8kTKhkLcj8KnDS1vki2oycPu834GEWq
	MQpLrSrlypRb7w0YgYCUTMUZnz4ACBC0hSpJlqt434LOOo3Ibd+c2jET
X-Gm-Gg: AZuq6aIBCxkVmazOed535ckbCFz5eXEGXAcYFQXBeB6jWFukxbbuVfh/KCafsA9zOCW
	XnavjRveMlrmyqD4lhHmOoBX1Wr0KbEhKWQ6/ReqC+UNJudjJemKESmtgdACOnSPYrbI/HW51mJ
	KSsrNq0AI4pzBhX4NfEgqovEukitOugkjpfXRUxHbLb6j4QjJSY1p1NgDB9QWCSS1jxb4LQ8xpZ
	grFoJW9Hq1yCZEDKPtij1LQJO+Eq/XGzJD7mViKUPkpqeqhF38Ise4cliHRkdqPFR2JcKH++RBB
	9/EsQmjHH+mpUt5byd4RoYLuwSjhAsa2N2xMOvw9pEu93xy+EPr6j3adRi6HcrTVJyaXkUy6MbH
	ZmortuIfRDd/Ej7MVYoLPoRrK4rnETwCLTe2NCVsOz661S5c/WW2ywtCbRUPpxwe9VyE/DELjXz
	yie7mucU3JzC8RfrU8CnJUw9NAhRvc3DBx4QHES5OjGfpoiwYFtVn1ItzXMYDQKg==
X-Received: by 2002:a05:600c:450c:b0:480:4be7:4f53 with SMTP id 5b1f17b1804b1-483a963d656mr119551865e9.31.1771805250470;
        Sun, 22 Feb 2026 16:07:30 -0800 (PST)
Received: from gandalf.schnuecks.de (p5b2e2ef5.dip0.t-ipconnect.de. [91.46.46.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3deb73bsm71630745e9.3.2026.02.22.16.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 16:07:29 -0800 (PST)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 451FC2FD757A; Mon, 23 Feb 2026 01:07:29 +0100 (CET)
Date: Mon, 23 Feb 2026 01:07:29 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>,
	Stefano Brivio <sbrivio@redhat.com>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>,
	Christian Ebner <c.ebner@proxmox.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/4] tcp: RFC 7323-compliant window
 retraction handling
Message-ID: <aZuaQSdsuWaAZza8@gandalf.schnuecks.de>
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
 <CANn89iLd=P2nftdMReVkc+d-8+0PGi1ACxhrhnVCxFVxNOhvJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iLd=P2nftdMReVkc+d-8+0PGi1ACxhrhnVCxFVxNOhvJg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,davemloft.net,kernel.org,redhat.com,lwn.net,linuxfoundation.org,gmail.com,cloudflare.com,proxmox.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-76503-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gmbnomis@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69C43170E3B
X-Rspamd-Action: no action

Hi Eric,

On Fri, Feb 20, 2026 at 09:58:00AM +0100, Eric Dumazet wrote:
> Hi Simon, thanks for the clean series.
> 
> I would guess you use some AI ? This is fine, just curious.

Thank you!  Yes, I’ve found AI helpful for getting familiar with a
new code base.  I also use it to refine or clean up the wording of
bigger commit messages.  Code generation works quite well for quick,
throw‑away code (like reproducers).
 
> Can you add more tests, in memory stress situations ?
> 
> Like :
> 
> A receiver grew the RWIN over time up to 8 MB.
> 
> Then the application (or the kernel under stress) used SO_RCVBUF to 16K.
> 
> I want to make sure the socket wont accept packets to fill the prior
> window and consume 8MB

I suspect generating 8 MB worth of RX data in packetdrill won't be
fun (unless there’s a trick I’m missing).  And using regular TCP
sockets on both ends would probably be rather uninteresting (no
packets sent once RWIN = 0)

It might be more practical to extend one of the tests to create two
situations in packetdrill:

1. Zero window:  0 == RWIN < 2 * squeezed SO_RCVBUF < tracked max. RWIN < 2 * original SO_RCVBUF
2. Small window: 0  < RWIN < 2 * squeezed SO_RCVBUF < tracked max. RWIN < 2 * original SO_RCVBUF

If these limits are sufficiently distinct, we could probe tcp_sequence() and
tcp_data_queue() paths in detail using:
  
* pure ACK or data packet
* in-order or out-of order
* within, partially within, or beyond (max) window

If we can show that we can't use more memory than expected for the
squeezed buffer, then the original max window size shouldn’t really
matter.

wdyt?

- Simon

-- 
Simon Baatz <gmbnomis@gmail.com>

