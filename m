Return-Path: <linux-doc+bounces-6674-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE982B18B
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jan 2024 16:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AD261F273C8
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jan 2024 15:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E82D4A987;
	Thu, 11 Jan 2024 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C7DPFKF2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08F4D128
	for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e759ece35so6128122e87.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 07:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704986272; x=1705591072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89hILc8fV7OBcQ3dgWJZyYhw//2b4isBBhmMXFJEhAw=;
        b=C7DPFKF26TKMW6PIxoivqKUA5SrT38l7Ad2wSTuGTrdxOr4pvcn/XtJJnArSgAThBD
         +AJVaKIL3zWu3Alt1XtESNfGve9xBaNfbNeaQHzD/AZcQDKPGRQO5X0RjluT8WvmO0tY
         v60aOrPFce65cCrPyzmRBMfLDRSgAZ9AilBNYWnQGPLwxaH5Aqm+5LW9fYzpM/j/PWGH
         ApuHTQxZav7V9/TiGCDLYaicK1ctgwfRMLScHU817hX3cOxx/THJyBvCsfF98ReIHiKs
         O9lAUrz340sf20lrciVKgEE0YG/eTmAaGrMGZnMFpSDWCyllREaUHYu2bI15M6sKCR1A
         86Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986272; x=1705591072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89hILc8fV7OBcQ3dgWJZyYhw//2b4isBBhmMXFJEhAw=;
        b=eUnTYWIzhqxb4HdQOwuEYdtaaIc5FAwii9tFsNKdyAsy3+cJ/C1h+AKG/NeEZeCua6
         H3QipqUyFcRChNCgayerY5E8tcXhtIwmLxbYI/Hs7SC+r9uH8ZIBQiEB94k5FcQJF7ke
         120tXnGWkGWFRzrPd8AHMa6DygwfieIG0QiBY1/pk5WqMgv6PQbS0Xe91A9cT4pl8D9Q
         BFIYHCFvkJHy8ZMuTRi+7Q2HCKbxEe6ZohhLYJPw3SvAPfKUQQRAI8oi2hfskrqeEt0D
         WYUQG2x+fi/xAAkMaL1tqtXpcKBztbq+C1cFFNnlZuDsN3rDyM3GLYViGrtI2N/2W0Ly
         NxSA==
X-Gm-Message-State: AOJu0YyeJODP32p9I8ykpvoWGvSPgftnPQt73G/1JezYZyeLeiFADxTe
	Vof5bwqxUDd5SxvC8U7uU1ZSb+o1NsoE1A==
X-Google-Smtp-Source: AGHT+IGQxjTvuqUbZLYG67DMQyCKnaTyvAuZG8a1BLSP0ZFzDwIZ8/MUR8Cx7JtmDfDxDr9JNiEvUQ==
X-Received: by 2002:a05:6512:e85:b0:50e:abd1:bfc3 with SMTP id bi5-20020a0565120e8500b0050eabd1bfc3mr778644lfb.88.1704986272241;
        Thu, 11 Jan 2024 07:17:52 -0800 (PST)
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id m23-20020a50ef17000000b0055751515a84sm709308eds.51.2024.01.11.07.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 07:17:52 -0800 (PST)
Date: Thu, 11 Jan 2024 16:17:50 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Attreyee M <tintinm2017@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, jpoimboe@kernel.org,
	jikos@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	live-patching@vger.kernel.org
Subject: Re: [PATCH] Documentation/livepatch: Update terminology in livepatch
Message-ID: <ZaAGnlmCMbl0dhij@alley>
References: <20231223205813.32083-1-tintinm2017@gmail.com>
 <87o7eg607d.fsf@meer.lwn.net>
 <ZYpb6Woh45ZnEvCP@archie.me>
 <CAJjsb4reD_TVWRFonp90xXD4Ye2OOfOd894PzmfMKaP3qFkbYg@mail.gmail.com>
 <87jzohoy02.fsf@meer.lwn.net>
 <49cfdce3094fcc37ecf01bb358509c64ee8feed9.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49cfdce3094fcc37ecf01bb358509c64ee8feed9.camel@suse.com>

On Wed 2024-01-10 15:51:40, Marcos Paulo de Souza wrote:
> On Wed, 2024-01-10 at 11:15 -0700, Jonathan Corbet wrote:
> > Attreyee M <tintinm2017@gmail.com> writes:
> > 
> > > Hello maintainers, 
> > > 
> > > I wanted to ask if this patch of mine is accepted as of now. 
> > 
> > You never responded to the question that is still quoted in your
> > (unfortunately top-posted) email:
> > 
> > > So this is a classic example of saying what you have done, but not
> > > why.
> > > What makes this a change that we want?
> > 
> > So no, not accepted.  Even with a proper changelog, though, I'm not
> > sure
> > I see the value in that particular change.
> 
> >From time to time I see people complaining about the lack of new people
> coming to kernel development,

IMHO, it is much worse on the maintainers' side. There is a lack
of maintainers. And I believe that most of them have hard times
to manage the load. They should provide hints. But we could
not expect that they would do the work.

> and that Documentation would be a good
> start for some of them to learn how to send patches by email (which by
> itself is difficult...).

Attreyee, please read Documentation/process/submitting-patches.rst
before you send another version.

Also please run scripts/checkpatch.pl before you send the patches.

> As Documentation patches aren't backported, why not accept this patch?
> 
> Jon, I understand your reasoning, but I agree with Attreyee here. The
> term "acquire" fits better when in conjunction with "released" than
> "get".
> 
> Can you show an example of a good commit message to Attreyee so he can
> adjust and resend? I'm sure the next time he'll consider remember the
> suggestion given and the next patch will have a better commit message.

I suggest that Attreyee makes another attempt himself.

John explained what was the problem. Attreyee could get inspiration from
the git history. Anyway, the commit message simply should explain why
"acquire" is better than "get".

Best Regards,
Petr

