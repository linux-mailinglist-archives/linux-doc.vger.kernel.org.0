Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8600F108697
	for <lists+linux-doc@lfdr.de>; Mon, 25 Nov 2019 03:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfKYCs5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 24 Nov 2019 21:48:57 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:36680 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKYCs5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Nov 2019 21:48:57 -0500
Received: by mail-io1-f68.google.com with SMTP id s3so14513514ioe.3
        for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2019 18:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=JfC2mJ/tM0Gtil8eGoDF2rqsQ/Szyy5PK2H9MiBjWaY=;
        b=BqbheMcM+/+8L5FUajWmcRC1Jt2EFb2gJwq13R2AdKWr4u92cpi/Qku/FU9A2Eu+bw
         ynY6/cjU7Rtcg/TUulvsuyxfJbeMQqKE1Bx0d7bCGvwzC63FW/yS2hxaeTiWMC9Jp2uG
         vRibYDUPgmnMbpZYvsxjswCE6r9A/t7AaQPMd6/EzO+s01YSFOmtqZTeGwp1lgVm3eze
         y4DKreOlFHLvcUqPFKdhUhm4W51onBLMZZ1FAIwmxhjItpmYJcYkwxB7IFMbDBVSFV4x
         Eq8vviYfv3npRjVahtOivSpmld1ch/YnzuGoNXuN7vLSX7IIiNcR7DRQrKJ8lN3coW9m
         T7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=JfC2mJ/tM0Gtil8eGoDF2rqsQ/Szyy5PK2H9MiBjWaY=;
        b=aRsdRgpxbu08w+khxbUjhAdGQkN+OlFd3ADrfJLeS8kVss/7fewxK+V50pHKO7L+dx
         xnjfLY9WyFQ+Z0mTLrVlaDHh6Rjcl89WF1YjxmMul80WIQ/SG8SYyRK2ZVYuCUMHEANC
         6v+SiosgHSsnkCOput9IqYo+XWqB2jXtBhEQXk5K80gKz9oW5EPqBubqtaFThHtG4O3y
         eEuX7jNYHsNMrWwKxDD9jL4vqU8w84U7EXgLy6BLDeUeVfRRsVJoWKuSpjBnSGkK6vM/
         ScSut1s9Brohtg1lKVzRwI0qQATmlI1548PFyIUAIiBdi8bTGqgQISpx1k+3zth44cgs
         uPZA==
X-Gm-Message-State: APjAAAWN6i+aB5PUwlnUpotONV7mqPsKhm9g2msPyKmcEaDWfqNJvSPL
        /nRhjwXWa0FagBarfGQ91hrylQ==
X-Google-Smtp-Source: APXvYqxgFYzEUsZQS6ILtiWRgw3rG7t6lwifkA15Te4VPLhoWxbBdRnWhS7ZYmL1Y/h4E9NFkL+lqw==
X-Received: by 2002:a02:aa0c:: with SMTP id r12mr26180623jam.75.1574650136249;
        Sun, 24 Nov 2019 18:48:56 -0800 (PST)
Received: from localhost ([64.62.168.194])
        by smtp.gmail.com with ESMTPSA id w2sm1790189ilg.51.2019.11.24.18.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 18:48:55 -0800 (PST)
Date:   Sun, 24 Nov 2019 18:48:54 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Dan Williams <dan.j.williams@intel.com>
cc:     Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, krste@berkeley.edu,
        waterman@eecs.berkeley.edu,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: riscv: add patch acceptance guidelines
In-Reply-To: <CAPcyv4iqTR8s0v8jH7haWCBQAzhZinUEsypiH7Ts9FCf+F9Bvg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1911241841210.22625@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com> <20191123092552.1438bc95@lwn.net> <alpine.DEB.2.21.9999.1911231523390.14532@viisi.sifive.com> <CAPcyv4hmagCVLCTYmmv0U8-YD5BEoQPV=wtm5hbp3MxqwZRQUA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1911231546450.14532@viisi.sifive.com> <CAPcyv4hBNfabaZmKs0XF+UT9Py8zJqpNdu5KsToqp305NASKNA@mail.gmail.com> <alpine.DEB.2.21.9999.1911231637510.14532@viisi.sifive.com>
 <CAPcyv4iqTR8s0v8jH7haWCBQAzhZinUEsypiH7Ts9FCf+F9Bvg@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 23 Nov 2019, Dan Williams wrote:

> I'm open to updating the headers to make a section heading that
> matches what you're trying to convey, however that header definition
> should be globally agreed upon. I don't want the document that tries
> to clarify per-subsystem behaviours itself to have per-subsystem
> permutations. I think we, subsystem maintainers, at least need to be
> able to agree on the topics we disagree on.

Unless you're planning to, say, follow up with some kind of automated 
process working across all of the profile documents in such a way that it 
would make technical sense for the different sections to be standardized, 
I personally don't see any need at all for profile document 
standardization.  As far as I can tell, these documents are meant for 
humans, rather than computers, to read.  And in the absence of a strong 
technical rationale to limit how maintainers express themselves here, I 
don't think it's justified.


- Paul
