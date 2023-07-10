class TikTokAccessToken {
  final String accessToken, openId, refreshToken;
  final int expires, refreshExpires;

  /// Most likely won't use refresh token but would be nice to keep?
  TikTokAccessToken(this.accessToken, this.openId, this.refreshToken,
      this.expires, this.refreshExpires);

  factory TikTokAccessToken.fromJSON(Map<String, dynamic> json) {
    return TikTokAccessToken(
      json['access_token'] as String,
      json['open_id'] as String,
      json['refresh_token'] as String,
      json['expires_in'] as int,
      json['refresh_expires_in'] as int,
    );
  }
}
