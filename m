Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2B84F960F
	for <lists+linux-doc@lfdr.de>; Fri,  8 Apr 2022 14:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235890AbiDHMtQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 Apr 2022 08:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235886AbiDHMtN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 08:49:13 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3ECFF32BC
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 05:47:09 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id j6so4653892qkp.9
        for <linux-doc@vger.kernel.org>; Fri, 08 Apr 2022 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+UmN5QSTipDoR1+pYRn+OgM9VMV5Y7wV2SBZNW6iL7g=;
        b=jHVh3ANqL2a6T4nybvptnE0F3Sig3panFK4YWvNgJz4zwQrzhPDlLLhgAKrynQiRR8
         gmqACBQ2pmNM8PT0W2SBZtDqbhfCG7WWFiYhzCcdDI8orOe2PqGQjvA7bB1rVHonod25
         q8aEV0bDQ0HzLhMf761vHFGX/1hyiHzDr9UEhLto5ghBmXfa/EtxwXh+9l6o6RjD4hIP
         odsuuiwotsWptQrSJbxA4v/arN9R9D3VOZosoVuMATv42fG8L5divKIWLdYPtOn8+nQW
         BgWjATPrLHlmCGCXABGIkxbsbssZVamhU/1rA3KELRJzFWcsZhVq5uJNVjEGjbrflIpb
         vh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+UmN5QSTipDoR1+pYRn+OgM9VMV5Y7wV2SBZNW6iL7g=;
        b=U0NPs7jG8aQzJGPo9wHxrCf0d7EMVhNEcz+2vJS3iHAlvHl4c/egdVTBtYBBbB6KsS
         ZUSu6lYQIlhlLlRRMjNJG/ywN/girDOefWSSdMpTCFe0iBeLGBQ6aCUkZEzjkbEO4wvy
         hMyuXY35ZUbiC5oRZ/G+EL9SPQKybVuAXZsOuf2UOwUY/hCorlfoZ8kaJeGtRo08rsr1
         73up09oujFjiXhjgO8xFYTRL3RrtkT/Q/G7H2Am52ukMXcxq3hNT18D3sp3SkPAcv3F4
         icy3cgYGx9UPoKFHzlJyyW8TmVTzrszaDqDjerzG9bjpSPZJtjbNSiroBtYX28/xyEn1
         HRvA==
X-Gm-Message-State: AOAM533JAUujv1BylIdUB6Hm9jZCZjDiimrhJ/laO27IITj6DtnzNN2C
        gD2604/hqPvzlq8gyG8g5CNk+g==
X-Google-Smtp-Source: ABdhPJx/GJQNiKv7ryzTKSFjMbwJ7feOzen3jxe65bgwDtz5b587MDR3U9C5Oj0pyfQuQf653ex6Cw==
X-Received: by 2002:a37:68d4:0:b0:67b:113f:c10e with SMTP id d203-20020a3768d4000000b0067b113fc10emr12780255qkc.350.1649422028848;
        Fri, 08 Apr 2022 05:47:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id w22-20020ac87e96000000b002eb8e71950csm17419162qtj.71.2022.04.08.05.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 05:47:08 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1nco15-00EysA-KU; Fri, 08 Apr 2022 09:47:07 -0300
Date:   Fri, 8 Apr 2022 09:47:07 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Matthew Rosato <mjrosato@linux.ibm.com>
Cc:     linux-s390@vger.kernel.org, alex.williamson@redhat.com,
        cohuck@redhat.com, schnelle@linux.ibm.com, farman@linux.ibm.com,
        pmorel@linux.ibm.com, borntraeger@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, gerald.schaefer@linux.ibm.com,
        agordeev@linux.ibm.com, svens@linux.ibm.com, frankja@linux.ibm.com,
        david@redhat.com, imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, thuth@redhat.com,
        pasic@linux.ibm.com, pbonzini@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 15/21] KVM: s390: pci: add routines to start/stop
 interpretive execution
Message-ID: <20220408124707.GY64706@ziepe.ca>
References: <20220404174349.58530-1-mjrosato@linux.ibm.com>
 <20220404174349.58530-16-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404174349.58530-16-mjrosato@linux.ibm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 04, 2022 at 01:43:43PM -0400, Matthew Rosato wrote:
> +int kvm_s390_pci_register_kvm(struct device *dev, void *data)
> +{
> +	struct zpci_dev *zdev = NULL;
> +	struct kvm *kvm = data;
> +
> +	/* Only proceed for zPCI devices, quietly ignore others */
> +	if (dev_is_pci(dev))
> +		zdev = to_zpci_dev(dev);
> +	if (!zdev)
> +		return 0;

Especially since this only works if we have zpci device

So having the zpci code hook the kvm notifier and then call the arch
code from the zpci area seems pretty OK

Also why is a struct kvm * being passed as a void *?

Jason
