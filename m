Return-Path: <linux-doc+bounces-95416-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gf8MGHwtTWrOwAEAu9opvQ
	(envelope-from <linux-doc+bounces-95416-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:46:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0971DFE4
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:46:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qtec.com header.s=google header.b=eQBqHDln;
	dmarc=pass (policy=reject) header.from=qtec.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95416-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95416-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BD9C3037142
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 16:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AB5435A83;
	Tue,  7 Jul 2026 16:40:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055413E51D7
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 16:40:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442405; cv=none; b=BpEke1JEZkO1qKTL6tx/ycwCJZuqWctc+4pwqE1CMawbKgcbw4zKnWWCnCvbZaT7r4p25n528IQFSEuUmS6XQ0lVa43NGQne39AjRnc9fW+QqKODoMGAOsRrD7AE0S2nJYUFcB/+4dvD8jzZP8IhY/ODDpCKO9JEHE1KpBQXHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442405; c=relaxed/simple;
	bh=2g2ASA9uUL2czsgfiQIRKQkJeCQtFlrYYz9gpwAoSRw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hk1eBQW+P0kG6URbtY/5S46AHpgjyGXxtQzHReDc9jc3Hka68zmlDJMgrKsESaZqHGBOUcmxWUGdXVbBrhAcmPUAracDRSE/R7FTdw7pJQUzyMC27rv7k69rMq1AevzPR50sclB71fn/HsAHe1u5xsFNJG8wiLjlQAol/hcd/nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com; spf=pass smtp.mailfrom=qtec.com; dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b=eQBqHDln; arc=none smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so4260050e87.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1783442401; x=1784047201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2g2ASA9uUL2czsgfiQIRKQkJeCQtFlrYYz9gpwAoSRw=;
        b=eQBqHDln1HfzUDQDgL9i7Arg6YfeyuwFSpC5x4wN+DyBKhKT3ofLuqFoaJER+/CvDI
         VXjX0jKoyZ6+lwpgrZdjN2Sow2scsh3p3mM63aSoSKQ+Q/hfRb9U4FNYcDqtYFNBWNks
         VMFPXzVSyu8g6v7xWrgF6z7fqRqQhBzXD0He8ov5d1+R34qdYtVyyezhmDo81fbeVyT2
         4/wLPooJCmJE2w5s4JS192L8hyhrSw2GIlI1/Zpp3M53AYg091uVKN0Z2CnPDXergLZu
         SWC68cNRykCR6UxDXVmlHnzQayjgtSX95heG5shAZm3rPwKnet4LWtn+lO5pH18udiEF
         te9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442401; x=1784047201;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2g2ASA9uUL2czsgfiQIRKQkJeCQtFlrYYz9gpwAoSRw=;
        b=bQAamCrXHLFU3f6YdC8R4rFuTrxMCbGFZMJJ8gdEu0wwLFVIdpWYqYZ8q9/5m1vPuJ
         4MLBYbtTREiZc+6ygHFvKYpYGQ12ylSdUYmSE1eH2gaJkxerOUrVYF4octo+xGOjAUns
         VNci6mvi1BBTmEQdA5cZK1mX4vSG/9aJomVmpN1W/lcrXHaFFjXox3+fRsZP6XuPM6a8
         Ucqzu5rdkhY8ashdF+E4fNG+VSiPhzpqNbXHQ7dq5ol/TrdyyLGtfPjWSY+8KI8lW1WT
         +AZB9sRBCgWkLWsYKlW2PeJ+PbLXZW+BcwkTVsPiENPu/1I8wkW6bGLFIYAT+tPdHKD/
         99Bg==
X-Gm-Message-State: AOJu0YzyV8j2gMBJZXyDNE85WGGRXQ+0kmXQNUgz5C5vmS8ignUThmvs
	xL/CzHd75uW60iaazpG4PhIOLhGVxm/EiS8E+SKm+krHIrQMpB/dk/9Yz+YfzBFAj+8b1Rto+US
	8RUoYiJTHgOgRnGyAKB9OE0Or55dkq+Sz7fl/8U6yWUUd1rdf8/izC5vQBRXl89qBUp8pLLBH/Y
	o6XvIPJpBMGBqP2k3txZtMfd7w+DohLhgaEWchLA==
X-Gm-Gg: AfdE7clfNnRd+o9ikSepm08h7w/0GWA/AkjnseZnFG6BW7O4DEocduDEFBgqDm2hXpR
	3oElytFPIfMZvysQ2ERq3q9a9KqPq5JifW7UXYBU5g8PbN1nHKKt41/oRajmg0wKO41WyQqvq2E
	Mxl9YBjUU/mdDf4Izm+ml5GabLgi2ov5Uz0yMhhkOJKZqVvOD/jq9IzAxGIjPhVEAMKgFg9yPRU
	ivBgId4iANWxpS8J+lbMwyGWyKPDjx1w3e+lDGEbzB9THCfl5/W1wQ2lYw1N9kggqfoM+R2waTu
	CdHy8pNu0dL8P3UWiNhIRs4CrvSef6u16osOheYgN7QmA+AGG1ajdCrSqHQONifBHX9/cghz18L
	f8b65owI5ksk8HfESiNKG2JConGXet2NMBYnUntTp/ouwWdkV+9Jea0LPvptXRcXgJnOxvInc7z
	TXTgUG0KYoC+apEnEQitLr537VAxXWExsUsxMBWDXzMwdjAnpWjdm4eh6zgLDjw9OzfY7ASkdd8
	YNmiKlEjN8uG6jIoKqbH68uxE8UYlf3HVqOQuxSua4Mr2ILnTQB0+HdrepmUJO8W3cGnA==
X-Received: by 2002:a05:6512:6891:10b0:5ae:9d0f:19f2 with SMTP id 2adb3069b0e04-5b007b6eceamr990918e87.3.1783442400860;
        Tue, 07 Jul 2026 09:40:00 -0700 (PDT)
Received: from [192.168.2.43] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb774sm3864861e87.48.2026.07.07.09.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:40:00 -0700 (PDT)
Message-ID: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
Date: Tue, 7 Jul 2026 18:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-doc@vger.kernel.org, linux-media@vger.kernel.org
From: Daniel Lundberg Pedersen <dlp@qtec.com>
Subject: Bad wrapping in some tables
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qtec.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qtec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qtec.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95416-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dlp@qtec.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlp@qtec.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qtec.com:from_mime,qtec.com:dkim,qtec.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFE0971DFE4

I've noticed some bad wrapping happening in tables, seemingly only in the Media
docs, but that's also where I look the most, after v7.1.

See:

https://www.kernel.org/doc/html/v7.1/userspace-api/media/v4l/vidioc-create-bufs.html#c.V4L.v4l2_create_buffers

Compared to:

https://www.kernel.org/doc/html/v7.0/userspace-api/media/v4l/vidioc-create-bufs.html#c.V4L.v4l2_create_buffers

Other tables have also changed, but they don't end up this bad, e.g:

https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time-parameter-kgdbreboot

I've bisected it to be f2679ac773899f5fdea0b68d5077eef5f88dfd42 that has caused
the change, and I did try some quick changes to see if I could fix it for the
tables, but I didn't get any positive results.


Regards Daniel

