Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C083E1E52
	for <lists+linux-doc@lfdr.de>; Wed, 23 Oct 2019 16:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389921AbfJWOjn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Oct 2019 10:39:43 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34750 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392295AbfJWOjn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Oct 2019 10:39:43 -0400
Received: by mail-qt1-f193.google.com with SMTP id e14so12852436qto.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2019 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cI3mewysd0YFcu6PXf6k88qLXffpugUANjAKLd6gRMY=;
        b=NRaSP8sp25XQeK8FPDQqPVX8JwI8/s/OSekv+baFhEmbFPBXf2OJaeikb37JZa4sex
         smCIQO2nJO7VxNRXwwpIcP3/Wx+PPSR22ZflVQ6xSvkXBBYZUTEOFiZsBHYD74CztLJP
         4H6ldtYrkx7S7Q/IvsREJibTu+bcx5XG23tqeOtUjV2/CnIi/YsDtI0Zdrx+PJfs1TkH
         2fjoJYi8DNYnNxTJJ+5cU5LMHMoK2WXJQ1f3n2EUGB+F2LQIfb9lT9MOTqoknGQFKcMn
         EOPD/PcbqJhw80gXa6QV0oblnFGWroQmbTzSrLaFn9ONNLCQG5sszBPMn7MyvNgs9K+q
         ceTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cI3mewysd0YFcu6PXf6k88qLXffpugUANjAKLd6gRMY=;
        b=O8WvfMqzgWjSXYkHq03Ef8q2AWZQSpC9hQzwF33kvu2JffTpardlftli1Lmz97sjt4
         0uyF5poULInpUKNxYmREmN/dxUrJnKELU6GuMWax3mWMc7no8RY3TdcblrJVK7F6lBEa
         WX2wqJzY5w/hHWxzcAMJQjVVkml4pWhvgw3wgCxy9VgsGtzFEo0/E5z1J/T2BMSnETS9
         8s4lSqbwQyGkyFhzVt2Sf9s49q/Gy3qBvjDlGVbMqrNQaHzYqeyuFaq/nML89uEjEE+Q
         kGR1MNGIVlcxM/cAZvHbpFjEPx3R/G+fugrhSu0o4Qngk3K/4/2nl+cwzk+E5esAz9MD
         iD2A==
X-Gm-Message-State: APjAAAXXAZGfHFwVj4MAOUxcaGgNWCHUZWcsuJP3Yr5ynehxKl/LdDtz
        zHOQNYutAPiQS/YTuB5OvaNvIQ==
X-Google-Smtp-Source: APXvYqybZhmtEnJZ/gaQwkuI/5xv5HPpzclbdQcyQWru4VlVhVhLd2q1Bij3QkfGdmhCDNtyiimo5A==
X-Received: by 2002:a0c:d851:: with SMTP id i17mr9407305qvj.61.1571841581961;
        Wed, 23 Oct 2019 07:39:41 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.180])
        by smtp.gmail.com with ESMTPSA id x38sm7993330qtc.64.2019.10.23.07.39.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 07:39:41 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1iNHnY-0003Lg-OP; Wed, 23 Oct 2019 11:39:40 -0300
Date:   Wed, 23 Oct 2019 11:39:40 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dennis Dalessandro <dennis.dalessandro@intel.com>
Cc:     rd.dunlab@gmail.com, Max Gurtovoy <maxg@mellanox.com>,
        linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 00/12] infiniband kernel-doc fixes & driver-api/ chapter
Message-ID: <20191023143940.GK23952@ziepe.ca>
References: <20191010035239.532908118@gmail.com>
 <20191022184109.GA2155@ziepe.ca>
 <52276493-6c27-0bdd-2b3a-6475056dd4f1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52276493-6c27-0bdd-2b3a-6475056dd4f1@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 23, 2019 at 07:54:46AM -0400, Dennis Dalessandro wrote:
> On 10/22/2019 2:41 PM, Jason Gunthorpe wrote:
> > On Wed, Oct 09, 2019 at 08:52:39PM -0700, rd.dunlab@gmail.com wrote:
> > > 
> > > This patch series cleans up lots of kernel-doc in drivers/infiniband/
> > > and then adds an infiniband.rst file.
> > > 
> > > It also changes a few instances of non-exported functions from kernel-doc
> > > notation back to non-kernel-doc comments.
> > > 
> > > There are still a few kernel-doc and Sphinx warnings that I don't know how
> > > to resolve:
> > > 
> > >    ../drivers/infiniband/ulp/iser/iscsi_iser.h:401: warning: Function parameter or member 'all_list' not described in 'iser_fr_desc'
> > >    ../drivers/infiniband/ulp/iser/iscsi_iser.h:415: warning: Function parameter or member 'all_list' not described in 'iser_fr_pool'
> > 
> > Maybe Max can help?
> > 
> > >    ../drivers/infiniband/core/verbs.c:2510: WARNING: Unexpected indentation.
> > >    ../drivers/infiniband/core/verbs.c:2512: WARNING: Block quote ends without a blank line; unexpected unindent.
> > >    ../drivers/infiniband/core/verbs.c:2544: WARNING: Unexpected indentation.
> > 
> > I don't know what to make of these either.
> > 
> > Anyhow, it is an overall improvement, so I applied everything but
> > 
> > [05/12] infiniband: fix ulp/opa_vnic/opa_vnic_encap.h kernel-doc notation
> 
> Safe to assume the kbuild robot failure [1] is a result of this?
> 
> [1] https://marc.info/?l=linux-rdma&m=157177785916141&w=2

Yes, just more warnings

Jason
