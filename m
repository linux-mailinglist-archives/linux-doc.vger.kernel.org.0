Return-Path: <linux-doc+bounces-96546-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Al7KJDhVGpjgQAAu9opvQ
	(envelope-from <linux-doc+bounces-96546-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 15:01:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C6C74B333
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 15:01:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=F0tnbKfN;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96546-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96546-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D20C3006B09
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 12:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229AC409E01;
	Mon, 13 Jul 2026 12:59:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DE040F8E3
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 12:59:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947545; cv=pass; b=qFZqZPfQq3ddJK262a2YprdYC602Lwbp0JUqi8N3u91de7zDXe4amU7w7Lg5JX7MkF4ONwy/Gnt2DcyBJZGF+KYOqOej8uXeH72Me/AZDEGaz44APfrFSoOLneborHYjUMr03Hp9yF1ttaKtAwVN6lYns+BSfXhA0RlIUhgazjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947545; c=relaxed/simple;
	bh=ynJXX/0g+bmm5av8d/f9OIiUZMAgJA4fp6HreARgn4E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=C5/LI5jv0hUcedLADCPQMwPHFLNUkPXuVC3a41/Uxk9UzCUMsvVYXekcEoWvEosNfuzENZgtZVV2w6Mj+v+fVze6narUYwBmUeYp0imIHScB/p87omsc2UQqU/zRvRIeOkXh/Og1ImAs4CiACugdp6MTPcD+cT/3XH0Q2YdgXQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0tnbKfN; arc=pass smtp.client-ip=209.85.219.50
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ee88fce572so31086766d6.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 05:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783947541; cv=none;
        d=google.com; s=arc-20260327;
        b=bIOXiBYnRRI2TYd5aknrwgYy0d8GeICR6geUMF5Wjy8XWMK9fk0/FNznrAIwCL+YAV
         6C4m0tBKhdZ7jFtAuHPHIE0zyPpAELqGUfmm5KKuQWg0Vu9I0VKJv6txdF+9Gn0vjPzS
         5MFmEqJL61/aaNFvK8kmarP2Xsox8cI08wNLDuz8xjZQWXBNTIFiGPay5HSsBv0dkRjT
         FJbSddENte/6FNQFdDbaFKuV7C1wBLVNzEy6i+FS4ywcDAe4vtNT0LP5sn66u7PT9aOx
         xsSlYALedejwzdHuCME0KVTz+x6k/gtLHSHjAk8mqWBccXwZtqRxAyJ9Zlp96nRQ+6Dt
         2KxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ynJXX/0g+bmm5av8d/f9OIiUZMAgJA4fp6HreARgn4E=;
        fh=Y17tmoDNOE+UxeH2H2NY8Ym7A51sZ0ip7qrld3HybW4=;
        b=e0h+FPRapPmyKccNgNKWm/vJwjPL2FtZnXhVUvVD+KNNQ9hw1WxDUHdRgDLi4dILal
         cWn7EhmY94hCEMYmbKXHLugTaAGD1NzyYEeh0G7WOF8NnFrZ5PbnfB/ej8zNC6c1dNZu
         aXPI3ldHjgL3XBIZtO2kTpIqjQ1ypNvBNQMZGPn+SvYZQZiVtXo/IvYMu8WXv7uVd6TQ
         BTFR9To1CDZs3ZWN6YVL08NdvB0iVb95z/m0DLdlS/yYl/sweU0tBrVn4/giJcjV0Tcr
         bCITQP/8HrFC3KCRALIqfnLlhJceajVZfhkKIeg1wIB04i8zUcJVZPngsXDu2eXybbBm
         H3VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783947541; x=1784552341; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ynJXX/0g+bmm5av8d/f9OIiUZMAgJA4fp6HreARgn4E=;
        b=F0tnbKfNPV7ZNoxLoDxi1mnYkNo+yBzTkHiPIlWpzI1mH7PML7pfzULymmaSCdIc2U
         7D7Q0zuj0iGRdBIE2JuiV78SU53jQ/p+I/QagwcDemSs74Iq5Gnk7DI0W2Jnj1SoQqrd
         DBs62pZ9HImxUZ3/x+yBUoa78tfWOfzqTTejaaKMWFIEPVktBUqgELzvUDnBH3tX55Mt
         xRihdEsiQl9zvybXpLhuz3ieGHHvA+u2whn0r9GCWVymWKar3k+Z3VzRzrkyZB8VMMzN
         sJKATCs3SJvviUs9ivawenDmgdeBVP4b0GmCt9x5uvRBYasiDiC1m2Gx4LTGjBZgYI9a
         gitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947541; x=1784552341;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynJXX/0g+bmm5av8d/f9OIiUZMAgJA4fp6HreARgn4E=;
        b=QvFb9SYEJk2aO8hg6J3cyc2sMvzxreoaGgykahUBou49YajfchZtsw1BiHTQtbr605
         bVLgSFGJsx1azjHFphvBE7CLxSq9DqoMh0pCQfmS/4XDsre/jpRv8HUZtcACiMGkG/8o
         z++dWQ/JBs1YF8y+gYPWr5/fxQ/S4sC8IU5Qe/gsTqjDc8/VP8GdKn1lMv94cZck7Uje
         IgF5jgfIe66WEno8+s1ErWcU7IHxkvwVCIoJTEfdtmgJ2/w9Vzv0NQvqmM8zWLFGyIaG
         n2HepQbf7NYyhWDGD0XJzMWrmfW52veCrvua0CL18Ky54j75ZJzzlpMNEaHD6w7We3xS
         Rd1A==
X-Forwarded-Encrypted: i=1; AHgh+RpK6tqOQu9pF8Y3HWavx7/eGUVXTtEx3oYVeRYMcC2VA0dYGDFgetnfotj4unoAMr3DMDgkUuOnLu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkHDuntLuskfD82gTJg7M1CFlGM1dPz8Skhsi+HSD6cs0BjNd
	z+E1c3czveVk7800c4utLPfV8T/+l/6R6A1RKlnJQBZuSRC+NwhdrPKYY8UfF2ZW+jwouQHtlpx
	T8xeIdyWFTi94wfFgnsUOFn9anMXssPwENOHRz2o=
X-Gm-Gg: AfdE7cl6a93g5TTpVxmZ7TnH/ofIA6FVqPvaP5rui1XD+MLiawmkwrfLbCPAziLYcPj
	JHKgP6H84kSZvG5yn5q6IvDLex8IOLPMeMXx2XwHqewpL15XSqsIAw49dJZS9OexKEgwRTOcGWu
	8OsWBcIOJKuAmULW+M/Q2jis3Ng2Cuoxv44FWg6N5nAJhaWjMddPRbjkVabaw7lZcVe8Ydl6b7E
	OASoTbQgUcayyTPJQTcqq9FUKgORZnyjGyFYFh3RTHuBgwI7SJKSfdmX+QdDIZuIYhD41iZIfAg
	QG6yANtL1qZoUn9StKF8hVHG04yQaPJSQh4ZkjjMtUt63P+SjRvWCsXncxgv94kJtqiWXIhXB1T
	YE0KGaxKdqQ==
X-Received: by 2002:a05:6214:3b86:b0:8ff:54e5:db02 with SMTP id
 6a1803df08f44-90401782302mr103340206d6.15.1783947540987; Mon, 13 Jul 2026
 05:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 13 Jul 2026 09:58:49 -0300
X-Gm-Features: AUfX_mxCRa0lmzBwYtwz43eKEqpiDZuzN0Yz_J0-B7aABMpyH6qrBCHOLFQ9nlo
Message-ID: <CAMAsx6cLjU1N6zuM47KZcsRhq1ABvRZkw_y57szBHNe1o23tVw@mail.gmail.com>
Subject: Question regarding CC list for pt_BR translation patches
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96546-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5C6C74B333

Hi Jon,

I have been submitting patches to translate kernel documentation into
Brazilian Portuguese (pt_BR) and have been consistently including you
in the CC list.

However, I noticed that other contributors typically send their
translations solely to the linux-doc@vger.kernel.org mailing list
without CC'ing you directly. I want to ensure that I and the rest of
the pt_BR translation team are following the preferred workflow and
being respectful of your inbox.

Could you please clarify if you prefer to be CC'd on these translation
patches, or is sending them solely to the mailing list sufficient for
your review? I want to make sure we are following the community's best
practices.

Thanks for your guidance,

