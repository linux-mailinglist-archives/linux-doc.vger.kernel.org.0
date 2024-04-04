Return-Path: <linux-doc+bounces-13476-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B41C897E0E
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 05:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DFEB1C21542
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 03:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B056C208A3;
	Thu,  4 Apr 2024 03:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IwyC7xXR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6471CFB2
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 03:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712202711; cv=none; b=R4v7yHCPcZO5NapGWlyd9cGVeyH41ATo9Y2spDubxu4nRgJJG/JcR17YyimzS3SaYPZntG+iZLNbUUhypwsd65RXNZOgp65BdLZmJfYct+5nyBp2307q25E6gGbIN5IexQWn5V72xHXCjJVNzxl3TMEOdK+W7ETSCIfU2Qm0fQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712202711; c=relaxed/simple;
	bh=B9dOxzw4dzBQBtQcllwAa+JuTH4Ou/pXi1D/viWLkdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRWGzzZJGgJDk0qIiBoZqfGtxmqH0ldXIzvOjLgWZdrgCG9ChegKdczd0xED3s/e3k+q/KQ8boTENlXzLx2AxTKehrMKa4hwEsq/rY0ntUjZAVLKFQqyxzNcVOKnMfGZvaII8PNHq8GShzRZB6V3nMxVjvT5RKqbGzUY6g8YzKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IwyC7xXR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d6a1af9c07so6083721fa.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 20:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1712202708; x=1712807508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vDqlHAl1OJhdAxhG4ZncyXhtrTYRQkvOV/2prOcOxzw=;
        b=IwyC7xXRFTIV+P/s4EkgP1LlWHfTEGD9ONc061H7A6LUos0K/1RwdPJLGgSK5LRlG+
         Kn2ztiHbopGpd87S8lwZ2VPHABScxKaNfSXGT8bF7kCbHMmJsPn/HE4te8oxN4hnhd7L
         WbRJ8QokFcKLYofqfyx6wEAElaNer9eJ+FMXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712202708; x=1712807508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDqlHAl1OJhdAxhG4ZncyXhtrTYRQkvOV/2prOcOxzw=;
        b=uWvamZW2/6yQ98fVP9DXgjU4w3uocH8w+HYzlAi0CnAB+mAJAbnTcVZ13MP8u4wqwy
         bHJgSJcu5aL3SwjRlq6kjxWUQ/72O5YbuJx9dMP+V4XaujGgPGTK6+2zbGnbDbfhZuqx
         N61dusQHwgyy8pZuOumnbY/D8YRo43OxumqTS3MA7ovluu0+LPqULYpKyi3OAxTz8DOX
         XyFVubZTJ6e/7ELYBxsIL9/ut8XBLtUhtuMMUOKjqbKFj6wE++x0LxoKtH9pUMKn/c9l
         CsPewlknmSI6u+1luF5BLNgZyDaaGEdM/EMjGB+3HZqbRydlrdL3Z3QSmJKOKHbjBSDZ
         vAng==
X-Forwarded-Encrypted: i=1; AJvYcCUJxU26e9lQINhpdHViGlnExVH9syXzSpasBLSnVk+WxA55TPM/vYJtoliNzY2LzYwzAKL6c3NhYuH7DpDFAtp7t4Mv00uHiJhW
X-Gm-Message-State: AOJu0Yz1t30FpSSuXeZ4gJCKxOpY236I+HMILvkgdazsvtGsfHT3X7gY
	Z+Qo+i2HPumBVhGJFKq1rRPSwa316EtHBAfzp2PGGFxWdhY7rWbcC2yspx9rMTSiW2Ppi+k/563
	yD/68Ei3oN5GiDsh+/DMBNFKTlDFWQqQulSBS
X-Google-Smtp-Source: AGHT+IHnwtEhXua2WVkgLnF68DX2xKtbrnZm+/drmrsz8bMZ0IaAWzOJ8NXEXsuDvXd15hMDF4u9z1atkwe60W2R/04=
X-Received: by 2002:a05:6512:48d6:b0:513:a479:3ad9 with SMTP id
 er22-20020a05651248d600b00513a4793ad9mr733672lfb.55.1712202707747; Wed, 03
 Apr 2024 20:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403174133.37587-1-parav@nvidia.com> <20240403174133.37587-3-parav@nvidia.com>
In-Reply-To: <20240403174133.37587-3-parav@nvidia.com>
From: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Date: Thu, 4 Apr 2024 09:21:35 +0530
Message-ID: <CAH-L+nOBTvHefxv0PeGj6TjrAk3D2fAWTyb_puBDRYQTkEmPeA@mail.gmail.com>
Subject: Re: [net-next v3 2/2] mlx5/core: Support max_io_eqs for a function
To: Parav Pandit <parav@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net, saeedm@nvidia.com, 
	leon@kernel.org, jiri@resnulli.us, shayd@nvidia.com, danielj@nvidia.com, 
	dchumak@nvidia.com, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000034076606153d42b9"

--00000000000034076606153d42b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 11:12=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
> Implement get and set for the maximum IO event queues for SF and VF.
> This enables administrator on the hypervisor to control the maximum
> IO event queues which are typically used to derive the maximum and
> default number of net device channels or rdma device completion vectors.
>
> Reviewed-by: Shay Drory <shayd@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Thanks Parav for addressing the comments. Changes look good to me.

Reviewed-by: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
> ---
> changelog:
> v2->v3:
> - limited to 80 chars per line in devlink
> - fixed comments from Jakub in mlx5 driver to fix missing mutex unlock
>   on error path
> v1->v2:
> - fixed comments from Kalesh
> - fixed missing kfree in get call
> - returning error code for get cmd failure
> - fixed error msg copy paste error in set on cmd failure
> - limited code to 80 chars limit
> - fixed set function variables for reverse christmas tree
> ---
>  .../mellanox/mlx5/core/esw/devlink_port.c     |  4 +
>  .../net/ethernet/mellanox/mlx5/core/eswitch.h |  7 ++
>  .../mellanox/mlx5/core/eswitch_offloads.c     | 97 +++++++++++++++++++
>  3 files changed, 108 insertions(+)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/esw/devlink_port.c b=
/drivers/net/ethernet/mellanox/mlx5/core/esw/devlink_port.c
> index d8e739cbcbce..f8869c9b6802 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/esw/devlink_port.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/esw/devlink_port.c
> @@ -98,6 +98,8 @@ static const struct devlink_port_ops mlx5_esw_pf_vf_dl_=
port_ops =3D {
>         .port_fn_ipsec_packet_get =3D mlx5_devlink_port_fn_ipsec_packet_g=
et,
>         .port_fn_ipsec_packet_set =3D mlx5_devlink_port_fn_ipsec_packet_s=
et,
>  #endif /* CONFIG_XFRM_OFFLOAD */
> +       .port_fn_max_io_eqs_get =3D mlx5_devlink_port_fn_max_io_eqs_get,
> +       .port_fn_max_io_eqs_set =3D mlx5_devlink_port_fn_max_io_eqs_set,
>  };
>
>  static void mlx5_esw_offloads_sf_devlink_port_attrs_set(struct mlx5_eswi=
tch *esw,
> @@ -143,6 +145,8 @@ static const struct devlink_port_ops mlx5_esw_dl_sf_p=
ort_ops =3D {
>         .port_fn_state_get =3D mlx5_devlink_sf_port_fn_state_get,
>         .port_fn_state_set =3D mlx5_devlink_sf_port_fn_state_set,
>  #endif
> +       .port_fn_max_io_eqs_get =3D mlx5_devlink_port_fn_max_io_eqs_get,
> +       .port_fn_max_io_eqs_set =3D mlx5_devlink_port_fn_max_io_eqs_set,
>  };
>
>  int mlx5_esw_offloads_devlink_port_register(struct mlx5_eswitch *esw, st=
ruct mlx5_vport *vport)
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h b/drivers/=
net/ethernet/mellanox/mlx5/core/eswitch.h
> index 349e28a6dd8d..50ce1ea20dd4 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.h
> @@ -573,6 +573,13 @@ int mlx5_devlink_port_fn_ipsec_packet_get(struct dev=
link_port *port, bool *is_en
>  int mlx5_devlink_port_fn_ipsec_packet_set(struct devlink_port *port, boo=
l enable,
>                                           struct netlink_ext_ack *extack)=
;
>  #endif /* CONFIG_XFRM_OFFLOAD */
> +int mlx5_devlink_port_fn_max_io_eqs_get(struct devlink_port *port,
> +                                       u32 *max_io_eqs,
> +                                       struct netlink_ext_ack *extack);
> +int mlx5_devlink_port_fn_max_io_eqs_set(struct devlink_port *port,
> +                                       u32 max_io_eqs,
> +                                       struct netlink_ext_ack *extack);
> +
>  void *mlx5_eswitch_get_uplink_priv(struct mlx5_eswitch *esw, u8 rep_type=
);
>
>  int __mlx5_eswitch_set_vport_vlan(struct mlx5_eswitch *esw,
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c b=
/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> index baaae628b0a0..2ad50634b401 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
> @@ -66,6 +66,8 @@
>
>  #define MLX5_ESW_FT_OFFLOADS_DROP_RULE (1)
>
> +#define MLX5_ESW_MAX_CTRL_EQS 4
> +
>  static struct esw_vport_tbl_namespace mlx5_esw_vport_tbl_mirror_ns =3D {
>         .max_fte =3D MLX5_ESW_VPORT_TBL_SIZE,
>         .max_num_groups =3D MLX5_ESW_VPORT_TBL_NUM_GROUPS,
> @@ -4557,3 +4559,98 @@ int mlx5_devlink_port_fn_ipsec_packet_set(struct d=
evlink_port *port,
>         return err;
>  }
>  #endif /* CONFIG_XFRM_OFFLOAD */
> +
> +int
> +mlx5_devlink_port_fn_max_io_eqs_get(struct devlink_port *port, u32 *max_=
io_eqs,
> +                                   struct netlink_ext_ack *extack)
> +{
> +       struct mlx5_vport *vport =3D mlx5_devlink_port_vport_get(port);
> +       int query_out_sz =3D MLX5_ST_SZ_BYTES(query_hca_cap_out);
> +       u16 vport_num =3D vport->vport;
> +       struct mlx5_eswitch *esw;
> +       void *query_ctx;
> +       void *hca_caps;
> +       u32 max_eqs;
> +       int err;
> +
> +       esw =3D mlx5_devlink_eswitch_nocheck_get(port->devlink);
> +       if (!MLX5_CAP_GEN(esw->dev, vhca_resource_manager)) {
> +               NL_SET_ERR_MSG_MOD(extack,
> +                                  "Device doesn't support VHCA managemen=
t");
> +               return -EOPNOTSUPP;
> +       }
> +
> +       query_ctx =3D kzalloc(query_out_sz, GFP_KERNEL);
> +       if (!query_ctx)
> +               return -ENOMEM;
> +
> +       mutex_lock(&esw->state_lock);
> +       err =3D mlx5_vport_get_other_func_cap(esw->dev, vport_num, query_=
ctx,
> +                                           MLX5_CAP_GENERAL);
> +       if (err) {
> +               NL_SET_ERR_MSG_MOD(extack, "Failed getting HCA caps");
> +               goto out;
> +       }
> +
> +       hca_caps =3D MLX5_ADDR_OF(query_hca_cap_out, query_ctx, capabilit=
y);
> +       max_eqs =3D MLX5_GET(cmd_hca_cap, hca_caps, max_num_eqs);
> +       if (max_eqs < MLX5_ESW_MAX_CTRL_EQS)
> +               *max_io_eqs =3D 0;
> +       else
> +               *max_io_eqs =3D max_eqs - MLX5_ESW_MAX_CTRL_EQS;
> +out:
> +       mutex_unlock(&esw->state_lock);
> +       kfree(query_ctx);
> +       return err;
> +}
> +
> +int
> +mlx5_devlink_port_fn_max_io_eqs_set(struct devlink_port *port, u32 max_i=
o_eqs,
> +                                   struct netlink_ext_ack *extack)
> +{
> +       struct mlx5_vport *vport =3D mlx5_devlink_port_vport_get(port);
> +       int query_out_sz =3D MLX5_ST_SZ_BYTES(query_hca_cap_out);
> +       u16 max_eqs =3D max_io_eqs + MLX5_ESW_MAX_CTRL_EQS;
> +       u16 vport_num =3D vport->vport;
> +       struct mlx5_eswitch *esw;
> +       void *query_ctx;
> +       void *hca_caps;
> +       int err;
> +
> +       esw =3D mlx5_devlink_eswitch_nocheck_get(port->devlink);
> +       if (!MLX5_CAP_GEN(esw->dev, vhca_resource_manager)) {
> +               NL_SET_ERR_MSG_MOD(extack,
> +                                  "Device doesn't support VHCA managemen=
t");
> +               return -EOPNOTSUPP;
> +       }
> +
> +       if (max_io_eqs + MLX5_ESW_MAX_CTRL_EQS > USHRT_MAX) {
> +               NL_SET_ERR_MSG_MOD(extack, "Supplied value out of range")=
;
> +               return -EINVAL;
> +       }
> +
> +       query_ctx =3D kzalloc(query_out_sz, GFP_KERNEL);
> +       if (!query_ctx)
> +               return -ENOMEM;
> +
> +       mutex_lock(&esw->state_lock);
> +       err =3D mlx5_vport_get_other_func_cap(esw->dev, vport_num, query_=
ctx,
> +                                           MLX5_CAP_GENERAL);
> +       if (err) {
> +               NL_SET_ERR_MSG_MOD(extack, "Failed getting HCA caps");
> +               goto out;
> +       }
> +
> +       hca_caps =3D MLX5_ADDR_OF(query_hca_cap_out, query_ctx, capabilit=
y);
> +       MLX5_SET(cmd_hca_cap, hca_caps, max_num_eqs, max_eqs);
> +
> +       err =3D mlx5_vport_set_other_func_cap(esw->dev, hca_caps, vport_n=
um,
> +                                           MLX5_SET_HCA_CAP_OP_MOD_GENER=
AL_DEVICE);
> +       if (err)
> +               NL_SET_ERR_MSG_MOD(extack, "Failed setting HCA caps");
> +
> +out:
> +       mutex_unlock(&esw->state_lock);
> +       kfree(query_ctx);
> +       return err;
> +}
> --
> 2.26.2
>


--=20
Regards,
Kalesh A P

--00000000000034076606153d42b9
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBWowggRSoAMCAQICDDfBRQmwNSI92mit0zANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODI5NTZaFw0yNTA5MTAwODI5NTZaMIGi
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xHzAdBgNVBAMTFkthbGVzaCBBbmFra3VyIFB1cmF5aWwxMjAw
BgkqhkiG9w0BCQEWI2thbGVzaC1hbmFra3VyLnB1cmF5aWxAYnJvYWRjb20uY29tMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxnv1Reaeezfr6NEmg3xZlh4cz9m7QCN13+j4z1scrX+b
JfnV8xITT5yvwdQv3R3p7nzD/t29lTRWK3wjodUd2nImo6vBaH3JbDwleIjIWhDXLNZ4u7WIXYwx
aQ8lYCdKXRsHXgGPY0+zSx9ddpqHZJlHwcvas3oKnQN9WgzZtsM7A8SJefWkNvkcOtef6bL8Ew+3
FBfXmtsPL9I2vita8gkYzunj9Nu2IM+MnsP7V/+Coy/yZDtFJHp30hDnYGzuOhJchDF9/eASvE8T
T1xqJODKM9xn5xXB1qezadfdgUs8k8QAYyP/oVBafF9uqDudL6otcBnziyDBQdFCuAQN7wIDAQAB
o4IB5DCCAeAwDgYDVR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZC
aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJj
YTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3Iz
cGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNV
HR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNp
Z24yY2EyMDIwLmNybDAuBgNVHREEJzAlgSNrYWxlc2gtYW5ha2t1ci5wdXJheWlsQGJyb2FkY29t
LmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGP
zzAdBgNVHQ4EFgQUI3+tdStI+ABRGSqksMsiCmO9uDAwDQYJKoZIhvcNAQELBQADggEBAGfe1o9b
4wUud0FMjb/FNdc433meL15npjdYWUeioHdlCGB5UvEaMGu71QysfoDOfUNeyO9YKp0h0fm7clvo
cBqeWe4CPv9TQbmLEtXKdEpj5kFZBGmav69mGTlu1A9KDQW3y0CDzCPG2Fdm4s73PnkwvemRk9E2
u9/kcZ8KWVeS+xq+XZ78kGTKQ6Wii3dMK/EHQhnDfidadoN/n+x2ySC8yyDNvy81BocnblQzvbuB
a30CvRuhokNO6Jzh7ZFtjKVMzYas3oo6HXgA+slRszMu4pc+fRPO41FHjeDM76e6P5OnthhnD+NY
x6xokUN65DN1bn2MkeNs0nQpizDqd0QxggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25h
bFNpZ24gMiBDQSAyMDIwAgw3wUUJsDUiPdpordMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcN
AQkEMSIEIEtVOkMEHxir1kgl7R4cCI5FBx6TJO6cROqlOEflF+2FMBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDQwNDAzNTE0OFowaQYJKoZIhvcNAQkPMVwwWjAL
BglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG
9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAzWClfx6qa
4Z04NVxzq2d+/0gzvKZkh1Gu5ZF9rs89D6m4GJEaAfT0JmpAisZrWq75Jbg+H/e+sy/ykiYR0N2n
ItLLsg2hfd6wGsedTXGMkskXKPgcme/MHeyWQ2Nq6wLlZwYmnWB8wsraQTeo0LReIuGFlWk0Jv7r
AjLX+PUyU4KgxEfUPifkCyLJ2O6mq2xw6kX/1qoi9GHRJSOwiU32oGifLqsH5TckokIqsL/mqgb0
g0xemoU2osXLHNFsHsuJmQSV0MW9TCTDhPqrqLAFFU3zJBUa6TZcToqyjfqgE6xmu+h/BmN6crtC
iwjVcr0lYfz+jSbIZ/dRbCGQU78r
--00000000000034076606153d42b9--

