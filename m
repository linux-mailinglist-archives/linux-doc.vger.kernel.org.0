Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82D211A2E1C
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2020 05:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgDID70 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Apr 2020 23:59:26 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42480 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgDID7Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Apr 2020 23:59:25 -0400
Received: by mail-ot1-f68.google.com with SMTP id t92so210938otb.9
        for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2020 20:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XmvlzvuP/vnjEDUAwKX6NbPh583pohCBXmnvTfFr87o=;
        b=WcfWA0De+txeD+3/qwDi56IMDD7hs+I4DO8x9nTO8TIxgeXl/V6E/fN2vgTJLcstLM
         886C43uVdfSX+4NagjIP3e0rIvnsIACoAp2qqqM5tvPsuRtdRo/dBdIGz6pgvqafbnCT
         MsXHtdqENcOPqOgGtN1jR8qa4q/4FJvT2MDhcwQmEOSaIsCkJOoq9bfK6evwJJAQf9p3
         5uXnh52JdhZywazugrRBkXfhasgQzdTE5rD/ltu3H/cGMygWVnIGBwyE9oE35OHCFXCd
         +7FEkU/SMbmBstyAFQ85PLXt1sHRn/iZkz4um5cIC0b0Xfayi2XLvfYGZZPAN4AdQCTi
         4iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XmvlzvuP/vnjEDUAwKX6NbPh583pohCBXmnvTfFr87o=;
        b=l2ySuSMjhF0q4BLVDlv+u1/qZohPVjUBDn+gplVJPuYxArHrzqqbxWhItzzIDOXr8f
         ZuxjMEMjuGtTPeHSicH5voPYD12QNtZ1pywXtZ2+rMvI4kgcC/80/IugOQyYhpSraAb6
         wu2CUJWRZWgQZrWFeGWn5syfqGVqglfGMHVVEmNkam7Dla1gyvWnkyjqV3+V3KkIcen9
         F2efP4hzQUEsFDOBx9rC++V2akPA2OYzFUxYE8dLmURY2U6+DgSLRl7dGPx/sm0WKP3A
         9sR987HjLBlUpOL/Y8mJsCD+X6zn2BTEYFAGYWPqagaS+N0sByPTnM7bimfeN7nE721L
         RnoA==
X-Gm-Message-State: AGi0PubVz3oT5ZH5ZWaW+spJeN5ogtdEQzH7+L/Pz6XCeXL4ImSmkHY+
        u+l4NPxjUKtqjLcOtAp4FnL2klFDiBU/Do4px0MG7csrqTzm5g==
X-Google-Smtp-Source: APiQypIL+VSKtQqdwmZy4oiaXjGpHl/0mTLNWmmy5b0h+TbJd0NijtQXz9X0wf4utwLodwHw+mkZqIhkKaDKK9J/bMo=
X-Received: by 2002:a05:6830:1e79:: with SMTP id m25mr8202815otr.36.1586404765365;
 Wed, 08 Apr 2020 20:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org>
In-Reply-To: <7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 9 Apr 2020 09:29:13 +0530
Message-ID: <CAO_48GHuPAMgnbPDHgZs3kd=xDXssBD+H8-xi3zR4nSgsA1hdQ@mail.gmail.com>
Subject: Re: [PATCH -next] dma-buf: fix documentation build warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Randy,


On Wed, 8 Apr 2020 at 09:50, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix documentation warnings in dma-buf.[hc]:

Thank you for your patch; I will apply it to drm-misc tree.
>
> ../drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> ../drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> ../include/linux/dma-buf.h:339: warning: Incorrect use of kernel-doc format:          * @move_notify
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/dma-buf/dma-buf.c |    4 ++--
>  include/linux/dma-buf.h   |    3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> --- linux-next-20200407.orig/drivers/dma-buf/dma-buf.c
> +++ linux-next-20200407/drivers/dma-buf/dma-buf.c
> @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   * calls attach() of dma_buf_ops to allow device-specific attach functionality
>   * @dmabuf:            [in]    buffer to attach device to.
>   * @dev:               [in]    device to be attached.
> - * @importer_ops       [in]    importer operations for the attachment
> - * @importer_priv      [in]    importer private pointer for the attachment
> + * @importer_ops:      [in]    importer operations for the attachment
> + * @importer_priv:     [in]    importer private pointer for the attachment
>   *
>   * Returns struct dma_buf_attachment pointer for this attachment. Attachments
>   * must be cleaned up by calling dma_buf_detach().
> --- linux-next-20200407.orig/include/linux/dma-buf.h
> +++ linux-next-20200407/include/linux/dma-buf.h
> @@ -329,13 +329,12 @@ struct dma_buf {
>
>  /**
>   * struct dma_buf_attach_ops - importer operations for an attachment
> - * @move_notify: [optional] notification that the DMA-buf is moving
>   *
>   * Attachment operations implemented by the importer.
>   */
>  struct dma_buf_attach_ops {
>         /**
> -        * @move_notify
> +        * @move_notify: [optional] notification that the DMA-buf is moving
>          *
>          * If this callback is provided the framework can avoid pinning the
>          * backing store while mappings exists.
>

Best,
Sumit.
