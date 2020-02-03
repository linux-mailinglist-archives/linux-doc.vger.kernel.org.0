Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 796B115071E
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2020 14:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgBCNYc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Feb 2020 08:24:32 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44412 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgBCNYb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Feb 2020 08:24:31 -0500
Received: by mail-lj1-f194.google.com with SMTP id q8so14579973ljj.11
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2020 05:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zkts+cGeEEtVuxNtWUSWiHH/b9CvDi3byTsQsBOoffc=;
        b=uMg77BV0yqbAokDjCIsX7WMm2+rljZD30A9Pgzvg2whq0fdLlCKNcVner/6Vldy+Do
         FJQe9cz1HwrRCTkHR76IWJkaU5PiNAe3jfkVCM41ucop+Vhsr3TE8nBD+OZBkeOwg1tK
         tIwWZLieJoA/GglHEidrlbm6zzJlqI84LHEJYsB4i6yqavXKRSdIIRjV07xPQ9irUsii
         fqWGRS0az2183mpkYJlDAldhbLf4FtoF5fIgpFJmgnWg+6SKmWS1oF6zqS+n4NWU8e0P
         L1jvslaK69PxYYY/eLHnnLHG+RZYhMnLAKnh/UgEnV0qIGCLCEPbaD8fIfWosAQBpGkK
         18JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zkts+cGeEEtVuxNtWUSWiHH/b9CvDi3byTsQsBOoffc=;
        b=dBrV7wExJethfMXPNiR/Wtx+O3RqXK4BdnYR6yMyc0afRd7lVSDjGJMDbOHOfcRVHI
         eFGJ7AflA6Lktds5eLIUaq4OiyoU7SQxUPu6uPscUzBhqGIqlLBEL4kNAKYGsQmAywJw
         +foZw5u91aolORLf/eWCs7Z+rLgPRYYspaKBQXcck7eGvH0dctqSqGPXhtVrKXhqrBW9
         k3PNJD5+LEwXaS+wbGqInl9OQFsYOP/ADnbhIU/uSUxk3wswhF96FKv4hMi3VjhDzOYg
         8cefRskZuCgwEZFLSKfkeSrzOqi93fKP3PL1B5plq6Rzx4DqYFL3GuHeZiGE5t80r8Ol
         mHxg==
X-Gm-Message-State: APjAAAXvG+QmDAQDGqvGXAF6cCszHkTUsCTgE3yoVAQ8soHxT7jUjy4n
        qAYIwsj1RjaPmmfUEaJ3ZaCRDw==
X-Google-Smtp-Source: APXvYqxyrBwcLQLkKywdLgZRmnj/Xxrleln4eaTTDtgmBedmh/EgtmO52sB+qALEUQcISXFUYFMPnA==
X-Received: by 2002:a05:651c:102c:: with SMTP id w12mr13991181ljm.53.1580736269586;
        Mon, 03 Feb 2020 05:24:29 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id n23sm8931924lfa.41.2020.02.03.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 05:24:28 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id B6499100DC8; Mon,  3 Feb 2020 16:24:41 +0300 (+03)
Date:   Mon, 3 Feb 2020 16:24:41 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Chinner <david@fromorbit.com>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 05/12] mm/gup: pass gup flags to two more routines
Message-ID: <20200203132441.ig7qihjvz5mfgcnc@box>
References: <20200201034029.4063170-1-jhubbard@nvidia.com>
 <20200201034029.4063170-6-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200201034029.4063170-6-jhubbard@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 31, 2020 at 07:40:22PM -0800, John Hubbard wrote:
> In preparation for an upcoming patch, send gup flags args to two more
> routines: put_compound_head(), and undo_dev_pagemap().
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
