Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0799A10811D
	for <lists+linux-doc@lfdr.de>; Sun, 24 Nov 2019 00:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfKWXuB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 23 Nov 2019 18:50:01 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:34934 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfKWXuB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Nov 2019 18:50:01 -0500
Received: by mail-il1-f194.google.com with SMTP id g12so1362491ild.2
        for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2019 15:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=s4GCLK+fIVn+snaTOmwkPoaXDJP7z3FcdVJMD3d4BQk=;
        b=ASgrvDPj4A/sFmDffZ+2PUQ5GRVEw02fOaSJyhpnDMyd/H5wMQMT7uoyC6CSBOV0DN
         XshcS1H7NEePIkGvTrLcYM+wJjDXbAY0UALDwOCzKe9eJJU2jp9LBkFJhwqKmQOc06om
         /3RULDjh5ysrs72RSWCed9tWmL1qV0D0ATRvna9IgeYdj/JxvGbuoJ3mgWWyy4nKgXdT
         WhRqjru2yEpjEVtQ5VAZiiiN+bjb9NczEH4SKT4u3F8HbVLB29jNhQSDi06IE3ISaQCc
         Or9q/yVZqf9WmSQ9q71QDzHPdCJ1AlOw1Mra3SKkK84m0+qD88loZLVykWYE/aGiE5dG
         Z/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=s4GCLK+fIVn+snaTOmwkPoaXDJP7z3FcdVJMD3d4BQk=;
        b=Pjh8EKW1Z9JR9n1B1shhTPBp3QzfrW8H0HhE6WB502nezfBZzEwlF04m1mrI4aM0lQ
         3rp42ZLubqOQIKDZ6KerXyd369FizT3oECuB7ch9xK0Bwkq9499Cc6JAu2K3Mf0YE8to
         BNF47UMhk8UeRFk6iDKenrWgmxtCG0ef2ioX8eSIiVpe73/r/lRmZGUvAlHnj9ypqN+k
         nztBPF/KdMjv/whUKXtvlpCa4quUUb6qTLDqZv/LH8um14xXErzMo+MsnGQPMgYOKsSA
         NKmRX9K24gjCyvO9QR99/jji8tcNNar0NprHguHA4Xca4CcVrR8UMtzNk6mhbe7CUVSs
         vzjw==
X-Gm-Message-State: APjAAAU/6aDbQJTJKi4as/AsHMfp8r6yyNBpQWJXydPX7u2J5Sui2zQ1
        coLCqtKsimc7F22VKDBQim5R7g==
X-Google-Smtp-Source: APXvYqwfIV3uzdikoiQkcpfkAzGQuZULk1koZ3M8WX2S/VzCwOcD7E1RvKXMwMxHjNC5GYXTXUVh1Q==
X-Received: by 2002:a92:680e:: with SMTP id d14mr26576786ilc.224.1574553000174;
        Sat, 23 Nov 2019 15:50:00 -0800 (PST)
Received: from localhost ([64.62.168.194])
        by smtp.gmail.com with ESMTPSA id g12sm596204ion.82.2019.11.23.15.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 15:49:59 -0800 (PST)
Date:   Sat, 23 Nov 2019 15:49:56 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Dan Williams <dan.j.williams@intel.com>
cc:     Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, krste@berkeley.edu,
        waterman@eecs.berkeley.edu,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: riscv: add patch acceptance guidelines
In-Reply-To: <CAPcyv4hmagCVLCTYmmv0U8-YD5BEoQPV=wtm5hbp3MxqwZRQUA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1911231546450.14532@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1911221842200.14532@viisi.sifive.com> <20191123092552.1438bc95@lwn.net> <alpine.DEB.2.21.9999.1911231523390.14532@viisi.sifive.com> <CAPcyv4hmagCVLCTYmmv0U8-YD5BEoQPV=wtm5hbp3MxqwZRQUA@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 23 Nov 2019, Dan Williams wrote:

> On Sat, Nov 23, 2019 at 3:27 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> > It looks like the main thing that would be needed would be to add the P:
> > entry with the path to our patch-acceptance.rst file into the MAINTAINERS
> > file, after Dan's patches are merged.
> >
> > Of course, we could also add more information about sparse cleanliness,
> > checkpatch warnings, etc., but we mostly try to follow the common kernel
> > guidelines there.
> 
> Those could likely be automated to highlight warnings that a given
> subsystem treats as errors, but wherever possible my expectation is
> that the policy should be specified globally.
> 
> > Is that summary accurate, or did I miss some additional steps?
> 
> I'll go fixup and get the into patch submitted today then we can go from 
> there.

I guess I'm still looking for guidance along the lines of my earlier 
question: what (if anything) would we need to change about the current 
patch to have it work with the maintainer profile documentation (beyond 
the "P:" entry in MAINTAINERS) ?


- Paul
