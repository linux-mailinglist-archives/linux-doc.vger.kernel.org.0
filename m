Return-Path: <linux-doc+bounces-930-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ABC7D4BC1
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 11:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C380B20CAD
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 09:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0363224C6;
	Tue, 24 Oct 2023 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fd7NavnQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D233D0;
	Tue, 24 Oct 2023 09:17:11 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEE310C6;
	Tue, 24 Oct 2023 02:17:10 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59e88a28b98so35946337b3.1;
        Tue, 24 Oct 2023 02:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698139029; x=1698743829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNYeLrZv7kaj7YSjwLQVnoc7iNnINn+4roLTxfquFmk=;
        b=fd7NavnQ+IWDLgDQ293ww0m3Va7EnR8Tpeip0zbVP7NC1fzT2uBqk6uJc63YIL8u5W
         QYrW7pPYrsFtOcxPGZ0ItLIsomzD3Yh2aAfdVPzQW4jvN5TaZG0bmuap97T1Sw6GRS2a
         HU/W57fak/j1m6oxN3dF2q2RKojlYwkte6tzvv3RugmaVOu7a3VR0UuqMGCprU0VMnGu
         0kvls1+ZENGvp09QnzWKgEtOfA0aQlhsUEQRoaLlIb4G2/sMx1YI6A2Uu+++F1QtFZD/
         MunjI9nXUH0a5yVD/EvP4P8GHpYNJoSFzu6y+x1j/7298R2QfMXQuDRRYcgRET7BUN4h
         cM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698139029; x=1698743829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNYeLrZv7kaj7YSjwLQVnoc7iNnINn+4roLTxfquFmk=;
        b=whmOcIxHom/M0eEvZQON0N+dwR60O0VTsYyeIFJxUs6rsloS/Z1mmKsCeln+dDzRaf
         BGtXrNvF1QrU6N7JqFPskOGIqT9PccYsPlXbrMhMuZnwvepKHrbKf/+2b0aKA+g+r5L5
         LTN7oYDlNQrH9LWsLsAScPZtQxP5mCQuLjsCCs+I479ynnsQvw1vcjGQmo5Tqi8pmXd1
         PN2LTV1AM2LtcPP/6MdVNsKufWgcWHs3cr5OUWp1wEImmtNqRQpZd0LNNUGxRKYOGErm
         IHRFZTrnX6aV2seCoXZYlF8Hak+dUiZzEdk8FtZZEeIf4mH3XLx0iASVEIsRdcpHgK2l
         K8EQ==
X-Gm-Message-State: AOJu0YyD/x1gy/1b/sHojUcbHO73Kx/iVG/L9UKB6t+9Ea7huJ5zFI17
	6LpHbXn+YexFvX3njvWyUz+N4GSrtPWjQY0ZFb5wg4kBu1LWMQ==
X-Google-Smtp-Source: AGHT+IE5uxOZHvB7YhHuU8DvcHe0Glt6TPmvQBoHg68p9mpGEiIrWa8WAwQdbZ4hr++6HHHoiat5MZeXow2v8KGQWZU=
X-Received: by 2002:a05:690c:fd6:b0:5a7:f263:6873 with SMTP id
 dg22-20020a05690c0fd600b005a7f2636873mr13342557ywb.20.1698139029254; Tue, 24
 Oct 2023 02:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231018160922.1018962-1-ojeda@kernel.org> <dcb9d0bb-67a3-2f50-9d17-251baa24b066@amd.com>
In-Reply-To: <dcb9d0bb-67a3-2f50-9d17-251baa24b066@amd.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Oct 2023 11:16:57 +0200
Message-ID: <CANiq72kjbrU7gDOx6m+KY89B0YhAk0FQ8L9BvSXEF2UeYqP88w@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: add "The Rust experiment" section
To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 4:34=E2=80=AFPM Carlos Bilbao <carlos.bilbao@amd.co=
m> wrote:
>
> Personally, I would rephrase this to:
>
> "Please note that, as an end user, there are currently no in-tree drivers
> or modules suitable or intended for production use."

Yeah, I think the "yet" -> "currently" change helps, so I took it. I
haven't changed the "if" to "as" because some readers are not really
end users but kernel developers/maintainers, so I think it could be a
bit confusing.

> I think this will be helpful.
>
> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>

Thanks! I have changed the paragraph to this, can I still use your
`Reviewed-by`?

  If you are an end user, please note that there are currently no in-tree
  drivers/modules suitable or intended for production use, and that the Rus=
t
  support is still in development/experimental, especially for certain kern=
el
  configurations.

Cheers,
Miguel

