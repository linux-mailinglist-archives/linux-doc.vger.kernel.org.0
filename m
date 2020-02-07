Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9278E15583E
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2020 14:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgBGNRz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Feb 2020 08:17:55 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44212 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgBGNRy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Feb 2020 08:17:54 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so2083214ljj.11
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2020 05:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ormWsvlEB3xaoLQJ32yqI2+YJjynCIo+Gkrsb90CUoc=;
        b=zXiaaJaV/6vtSOmP9ODS2FF3enQ9DrLr2xaXqFISXdgWNN7JEZGqqteYAJg8ilecHC
         ugo7pUkEj4BeIf0kvvpCo+9nvJTidcqrfgAKlXwcZrT/G25Hc0OKXxZ/73AFix6/STWU
         kzL1F0LE/LTZEKILuppx9YGI01N+5ZbDcEQGL0HvU+uZcMgWGZCPrEAiaZ+BllPyAS7f
         imqyuyZC2NI4FLBEhH4BIw6rEMsgDbGkg9nOxXihh8ryQwuUgPpw2KkNvbQrfWBn7wd+
         mDYhZSynO7JxUG39HhOZIVunHOvL6zWKn3v9WqBVZysmR4JglhGrT7lyZay33uwkGfhZ
         Lp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ormWsvlEB3xaoLQJ32yqI2+YJjynCIo+Gkrsb90CUoc=;
        b=VDNdJgFo+4QERaA/j9H29TXniePkQUddhRlCjVPcT8/BQKDIQC7/9l6OvdQu6ir9Iw
         /nAoI2zEy1xn9loTIYXN06GVd2Y6vbMg9NjLowsnDERQKnVDQ6Zx1wjuRaOLMsoLZrQw
         zSh/pulV7DApA1k5ebBQlC1AWFZAjjlByGfZslxwTZuLICwj5W2DDXPVbSHDAdQuzqrW
         lGh8SSxuEMaMkgXq65UYku0BecyvCaOkp2PWh1r4P6svtRxcIRyjNwYGRtwiaZ13YV+f
         /gMOmP4t9dTzXPZmREUyTXh5YQT7Yxi/uINhTFBQXORVdr3aW6K1UcxyahzbZM20tdOt
         vsFQ==
X-Gm-Message-State: APjAAAVBs7nHNwlafjDVYiROvTUvgbQvOFfF+tH1xXP0Ibf2hzdN2aiQ
        oXfY85ZzXVAK9/kL3SKay/HYTw==
X-Google-Smtp-Source: APXvYqxpnU/YqzHLLTtDrHtrmgEZwjR2XCzlQQy/QlYwTJZA8pqDeflD/7gMq3smNNvvvq1H14aHzw==
X-Received: by 2002:a2e:7818:: with SMTP id t24mr5296927ljc.195.1581081470799;
        Fri, 07 Feb 2020 05:17:50 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id 3sm1236687lja.65.2020.02.07.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 05:17:49 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id 623C7100B12; Fri,  7 Feb 2020 16:18:06 +0300 (+03)
Date:   Fri, 7 Feb 2020 16:18:06 +0300
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
Subject: Re: [PATCH v5 04/12] mm: introduce page_ref_sub_return()
Message-ID: <20200207131806.xwnhxomxgt3hoqcc@box>
References: <20200207033735.308000-1-jhubbard@nvidia.com>
 <20200207033735.308000-5-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207033735.308000-5-jhubbard@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 06, 2020 at 07:37:27PM -0800, John Hubbard wrote:
> An upcoming patch requires subtracting a large chunk of refcounts from
> a page, and checking what the resulting refcount is. This is a little
> different than the usual "check for zero refcount" that many of the
> page ref functions already do. However, it is similar to a few other
> routines that (like this one) are generally useful for things such as
> 1-based refcounting.
> 
> Add page_ref_sub_return(), that subtracts a chunk of refcounts
> atomically, and returns an atomic snapshot of the result.
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
